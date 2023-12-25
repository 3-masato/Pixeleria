# frozen_string_literal: true

class Layout::ModalComponent < ViewComponent::Base
  def initialize
  end

  def backdrop_class
    classes = base_class
    classes += " backdrop-brightness-50"

    classes
  end

  def modal_class
    classes = base_class
    classes += " -translate-y-4 data-[visibility=visible]:translate-y-0"
    classes
  end

  private
  def base_class
    classes = "w-full h-full fixed top-0 left-0"
    classes += " ease-out transition-all duration-50"
    classes += " -z-50 opacity-0 invisible data-[visibility=visible]:z-50 data-[visibility=visible]:opacity-100 data-[visibility=visible]:visible"
    classes
  end
end
