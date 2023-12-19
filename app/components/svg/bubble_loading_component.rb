# frozen_string_literal: true

class Svg::BubbleLoadingComponent < ViewComponent::Base
  def initialize(width:, height:)
    @width = width
    @height = height
  end
end
