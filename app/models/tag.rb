class Tag < ApplicationRecord
  MAX_NAME_LENGTH = 24

  has_many :artwork_tags, dependent: :destroy
  has_many :artworks, through: :artwork_tags

  validates :name, presence: true, length: { maximum: MAX_NAME_LENGTH }

  def self.max_name_length
    MAX_NAME_LENGTH
  end
end
