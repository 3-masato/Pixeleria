class Artwork < ApplicationRecord
  MAX_TITLE_LENGTH = 24
  MAX_DESCRIPTION_LENGTH = 200

  belongs_to :user

  # 保存先のサービスをここで指定する。
  if Rails.env.production?
    # 本番環境ではS3に保存する。
    has_one_attached :image, service: :amazon_artwork_images
  else
    # 開発環境ではローカルに保存する。
    has_one_attached :image, service: :local
  end

  has_one :artwork_canvas, dependent: :destroy
  accepts_nested_attributes_for :artwork_canvas

  has_many :likes,        dependent: :destroy
  has_many :comments,     dependent: :destroy
  has_many :artwork_tags, dependent: :destroy
  has_many :tags,         through:   :artwork_tags
  has_many :reports,      as:        :reportable, dependent: :destroy

  validates :title, presence: true, length: { maximum: MAX_TITLE_LENGTH }
  validates :description, length: { maximum: MAX_DESCRIPTION_LENGTH }
  validates :is_public, inclusion: [true, false]

  # Artworkレコードを取得する際、デフォルトで新しい作品が先頭に来るようにする。
  default_scope { order(created_at: :desc) }

  scope :with_details, -> { includes(:likes, :comments, :tags, image_attachment: :blob, user: { profile_image_attachment: :blob }) }
  scope :publication, -> { where(is_public: true) }
  scope :unpublication, -> { where(is_public: false) }
  scope :with_publication, -> { with_details.publication }
  scope :search, -> (query, public_status) {
    artworks = all
    artworks = artworks.where('title LIKE ? OR description LIKE ?', "%#{query}%", "%#{query}%") if query.present?
    artworks = artworks.publication if public_status == "public"
    artworks = artworks.unpublication if public_status == "private"
    artworks
  }

  def get_image
    if Rails.env.production?
      "https://d39xcen2r68k3d.cloudfront.net/#{image.key}"
    else
      image
    end
  end

  def liked_by?(user)
    likes.any? { |like| like.user_id == user.id }
  end

  def tags=(tags_array)
    self.tags.clear
    tags_array.each do |tag_name|
      next if tag_name.blank?
      tag_name = tag_name.strip
      tag = Tag.find_or_create_by(name: tag_name)
      self.tags << tag unless self.tags.exists?(name: tag_name)
    end
  end

  def decode_and_attach_image(image_data)
    decoded_image = decode_image(image_data)
    image.attach(io: decoded_image, filename: "#{title}.png")
  end

  def width_px
    "#{artwork_canvas.width}px"
  end

  def height_px
    "#{artwork_canvas.height}px"
  end

  def self.max_title_length
    MAX_TITLE_LENGTH
  end

  def self.max_description_length
    MAX_DESCRIPTION_LENGTH
  end

  private
  def decode_image(data)
    # Base64のプレフィックスを削除し、デコードする
    base64_image = data.sub(/^data:image\/\w+;base64,/, "")
    decoded_image = Base64.decode64(base64_image)
    StringIO.new(decoded_image)
  end
end
