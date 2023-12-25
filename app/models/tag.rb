class Tag < ApplicationRecord
  has_many :artwork_tags, dependent: :destroy
  has_many :artworks, through: :artwork_tags

  validates :name, presence: true, length: { maximum: 30 }
end
