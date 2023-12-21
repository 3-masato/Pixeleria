# frozen_string_literal: true

class Utils::IconTextComponent < ViewComponent::Base
  def initialize(fa_class:, position: :left, **option)
    @fa_class = fa_class
    @position = position
    @base_class = "flex items-center whitespace-nowrap #{option[:class]}"
  end

  def content_class
    classes = "grow text-center"
    classes += " #{@position == :right ? "mr-2" : "ml-2"}"
    classes
  end
end
