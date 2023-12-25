# frozen_string_literal: true

class Layout::AlertComponent < ViewComponent::Base
  def initialize(flash:)
    @flash = flash
  end

  def message_type_class(key)
    case key
    when "notice"
      "border-teal-200 text-teal-800 bg-teal-100"
    when "alert"
      "border-yellow-200 text-yellow-800 bg-yellow-100"
    else
      "border-gray-200 text-gray-800 bg-gray-100"
    end
  end

  def icon_class(key)
    case key
    when "notice"
      "fa-solid fa-check"
    when "alert"
      "fa-solid fa-circle-exclamation"
    else
      "fa-solid fa-info-circle"
    end
  end
end
