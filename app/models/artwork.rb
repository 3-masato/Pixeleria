class Artwork < ApplicationRecord
  DESCRIPTION_MAX_LENGTH = 200

  belongs_to :user

  has_one_attached :image

  has_one :artwork_canvas, dependent: :destroy
  accepts_nested_attributes_for :artwork_canvas

  has_many :likes,        dependent: :destroy
  has_many :comments,     dependent: :destroy
  has_many :artwork_tags, dependent: :destroy
  has_many :tags,         through:   :artwork_tags
  has_many :reports,      as:        :reportable

  validates :title, presence: true
  validates :description, length: { maximum: DESCRIPTION_MAX_LENGTH }

  # Artworkレコードを取得する際、デフォルトで新しい作品が先頭に来るようにする。
  default_scope { order(created_at: :desc) }

  scope :with_details, -> { includes(:likes, :comments, :tags, image_attachment: :blob, user: { profile_image_attachment: :blob }) }

  scope :publication, -> { with_details.where(is_public: true) }

  scope :with_publication, -> { with_details.publication }

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


  def width_px
    "#{artwork_canvas.width}px"
  end

  def height_px
    "#{artwork_canvas.height}px"
  end

  def self.search(query)
    where('title LIKE ? OR description LIKE ?', "%#{query}%", "%#{query}%").with_publication
  end
end
