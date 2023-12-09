class Artwork < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  has_one :artwork_canvas

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :artwork_tags, dependent: :destroy
  has_many :tags, through: :artwork_tags

  # Artworkレコードを取得する際、デフォルトで新しい作品が先頭に来るようにする。
  default_scope { order(created_at: :desc) }

  scope :with_details, -> { includes(:likes, image_attachment: :blob) }

  def liked_by?(user)
    likes.any? { |like| like.user_id == user.id }
  end
end
