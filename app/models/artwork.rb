class Artwork < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :artwork_tags, dependent: :destroy
  has_many :tags, through: :artwork_tags
end
