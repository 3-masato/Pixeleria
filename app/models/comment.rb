class Comment < ApplicationRecord
   MAX_CONTENT_LENGTH = 120

  belongs_to :user
  belongs_to :artwork

  has_many :reports, as: :reportable, dependent: :destroy

  # Commentレコードを取得する際、デフォルトで新しいコメントが先頭に来るようにする。
  default_scope { order(created_at: :desc) }

  scope :with_user_profile_images, -> { includes(user: { profile_image_attachment: :blob }) }
  scope :with_artwork_images, -> { includes(:artwork => { image_attachment: :blob }) }

  validates :content, presence: true, length: { maximum: MAX_CONTENT_LENGTH }

  def self.max_content_length
    MAX_CONTENT_LENGTH
  end
end
