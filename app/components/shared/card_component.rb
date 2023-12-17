# frozen_string_literal: true

class Shared::CardComponent < ViewComponent::Base
  def initialize(**options)
    @class = options[:class]
  end

  def card_classes
    classes = "shadow-xl rounded-sm bg-white border border-gray-200"
    classes += " #{@class}"
    classes
  end
end
