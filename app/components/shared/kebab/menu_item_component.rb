# frozen_string_literal: true

class Shared::Kebab::MenuItemComponent < ViewComponent::Base
  def initialize(path:, color: :gray, **options)
    @path = path
    @color = color
    @options = options
  end

  def base_class
    classes = "w-32 grid items-center no-underline duration-50 transition-colors"
    classes += " #{color_class[@color]}"
    classes
  end

  def color_class
    {
      gray: "text-gray-900 hover:bg-gray-400/10",
      red: "text-red-500 hover:bg-red-400/10"
    }
  end
end
