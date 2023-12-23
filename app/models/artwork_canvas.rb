class ArtworkCanvas < ApplicationRecord
  belongs_to :artwork

  validates :width, numericality: { only_integer: true }
  validates :height, numericality: { only_integer: true }
  validate :validate_pixel_data

  private
  def validate_pixel_data
    return if pixel_data.blank?

    pixels = pixel_data.split(",").map(&:to_i)

    # 空判定については以下のIssueを参照
    # https://github.com/3-masato/Pixeleria/issues/71
    if pixels[1] == 2 && pixels[2] == 0
      errors.add(:pixel_data, "can't be empty like data")
    end
  end
end
 