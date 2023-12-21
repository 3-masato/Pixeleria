class User < ApplicationRecord
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
  has_many :reports,        as:        :reportable

  has_many :active_relationships,  class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings,            through: :active_relationships,  source: :followed
  has_many :followers,             through: :passive_relationships, source: :follower

  validates :display_name, presence: true
  validates(
    :account_name,
    presence: true,
    uniqueness: {
      case_sensitive: false
    },
    format: {
      with: /\A[\w]+\z/,
      message: :invalid
    }
  )

  def active_for_authentication?
    super && (status == "active")
  end

  def get_profile_image
    (profile_image.attached?) ? profile_image : "default-user-icon.jpeg"
  end

  def follow(user)
    unless following?(user)
      active_relationships.create(followed_id: user.id)
    end
  end

  def unfollow(user)
    if following?(user)
      active_relationships.find_by(followed_id: user.id).destroy
    end
  end

  def following?(user)
    followings.include?(user)
  end

  def self.guest
    guest_email = "guest_#{SecureRandom.hex(10)}@example.com"
    guest_account_name = "guest_#{SecureRandom.alphanumeric(16)}"

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
