class User < ApplicationRecord
  MAX_DISPLAY_NAME_LENGTH = 24
  MAX_ACCOUNT_NAME_LENGTH = 24
  MAX_INTRODUCTION_LENGTH = 240

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: {
    active: 0,
    deactivated: 1,
    suspended: 2
  }

  has_one_attached :profile_image

  has_many :artworks,       dependent: :destroy
  has_many :likes,          dependent: :destroy
  has_many :comments,       dependent: :destroy
  has_many :liked_artworks, through:   :likes,     source: :artwork
  has_many :reports,        as:        :reportable, dependent: :destroy

  has_many :active_relationships,  class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings,            through: :active_relationships,  source: :followed
  has_many :followers,             through: :passive_relationships, source: :follower

  validates :display_name, presence: true, length: { maximum: MAX_DISPLAY_NAME_LENGTH }
  validates(
    :account_name,
    presence: true,
    uniqueness: {
      case_sensitive: false
    },
    format: {
      with: /\A[\w]+\z/,
      message: :invalid
    },
    length: {
      maximum: MAX_ACCOUNT_NAME_LENGTH
    }
  )
  validates :introduction, length: { maximum: MAX_INTRODUCTION_LENGTH }

  # Userレコードを取得する際、デフォルトで新しい作品が先頭に来るようにする。
  default_scope { order(created_at: :desc) }
  scope :with_details, -> { includes(:followings, :followers, profile_image_attachment: :blob) }
  # Userの検索
  scope :search, -> (query, status) {
    users = all
    users = users.where("display_name LIKE ? OR introduction LIKE ?", "%#{query}%", "%#{query}%") if query.present?
    users = users.where(status: status) if status.present?
    users
  }

  def active_for_authentication?
    super && (status == "active")
  end

  def get_profile_image
    if profile_image.attached?
      "https://img-files-resize-53317.s3-ap-northeast-1.amazonaws.com/#{profile_image.key}-thumbnail.#{profile_image.content_type.split('/').pop}"
    else
      "default-user-icon.jpeg"
    end
  end

  def follow(user)
    active_relationships.create(followed_id: user.id) unless following?(user)
  end

  def unfollow(user)
    active_relationships.find_by(followed_id: user.id)&.destroy
  end

  def following?(user)
    active_relationships.exists?(followed_id: user.id)
  end

  def self.max_display_name_length
    MAX_DISPLAY_NAME_LENGTH
  end

  def self.max_account_name_length
    MAX_ACCOUNT_NAME_LENGTH
  end

  def self.max_introduction_length
    MAX_INTRODUCTION_LENGTH
  end

  def self.guest
    guest_email = "guest_#{SecureRandom.hex(10)}@example.com"
    guest_account_name = "guest_#{SecureRandom.alphanumeric(12)}"

    create!(
      email: guest_email,
      account_name: guest_account_name,
      password: SecureRandom.urlsafe_base64,
      is_guest: true
    ) do |user|
      user.display_name = "ゲストユーザー"
      user.introduction = "ゲストユーザーです。"
      user.status = 0
    end
  end
end
