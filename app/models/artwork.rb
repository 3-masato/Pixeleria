class Artwork < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  has_one :artwork_canvas, dependent: :destroy

  has_many :likes,        dependent: :destroy
  has_many :comments,     dependent: :destroy
  has_many :artwork_tags, dependent: :destroy
  has_many :tags,         through:   :artwork_tags
  has_many :reports,      as:        :reportable

  # Artworkレコードを取得する際、デフォルトで新しい作品が先頭に来るようにする。
  default_scope { order(created_at: :desc) }

  scope :with_details, -> { includes(:likes, :comments, :tags, image_attachment: :blob, user: { profile_image_attachment: :blob }) }

  scope :publication, -> { with_details.where(is_public: true) }

  scope :with_publication, -> { with_details.publication }

  def liked_by?(user)
    likes.any? { |like| like.user_id == user.id }
  end

  def save_tags(tags)
    # タグの名前を配列として取得（タグがない場合は空の配列を使用）
    current_tags = self.tags.pluck(:name) || []

    # 現在取得したタグから送られてきたタグを除いて古いタグを特定
    old_tags = current_tags - tags
    # 送信されてきたタグから現在存在するタグを除いたタグを新しいタグとして特定
    new_tags = tags - current_tags

    # 古いタグを削除
    old_tags.each do |old_name|
      self.tags.delete(Tag.find_by(name: old_name))
    end

    # 新しいタグを追加
    new_tags.each do |new_name|
      tag = Tag.find_or_create_by(name: new_name)
      self.tags << tag unless self.tags.exists?(name: new_name)
    end
  end

  def width_px
    "#{artwork_canvas.width}px"
  end

  def height_px
    "#{artwork_canvas.height}px"
  end

  def tags=(tags_array)
    self.tags.clear
    tags_array.each do |tag_name|
      next if tag_name.blank?
      tag = Tag.find_or_create_by(name: tag_name.strip)
      self.tags << tag unless self.tags.exists?(name: tag_name.strip)
    end
  end

  def self.search(query)
    where('title LIKE ? OR description LIKE ?', "%#{query}%", "%#{query}%").with_publication
  end
end
