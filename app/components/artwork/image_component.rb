# frozen_string_literal: true

class Artwork::ImageComponent < ViewComponent::Base
  attr_reader :artwork

  def initialize(artwork:, size:)
    @artwork = artwork
    @size = size
  end

  def image_attributes
    base_class = "m-0 rendering-pixelated"

    case @size
    when :xxl
      {
        width: 512,
        height: 512,
        class: "w-[512px] h-[512px] #{base_class}"
      }
    when :xl
      {
        width: 384,
        height: 384,
        class: "w-[384px] h-[384px] #{base_class}"
      }
    when :lg
      {
        width: 256,
        height: 256,
        class: "w-[256px] h-[256px] #{base_class}"
      }
    when :md
      {
        width: 192,
        height: 192,
        class: "w-[192px] h-[192px] #{base_class}"
      }
    when :sm
      {
        width: 128,
        height: 128,
        class: "w-[128px] h-[128px] #{base_class}"
      }
    end
  end
end
