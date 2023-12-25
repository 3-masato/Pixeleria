# frozen_string_literal: true

class Layout::NavItemComponent < ViewComponent::Base
  def initialize(item:)
    @path = item[:path]
    @text = item[:text]
    @method = item[:method] || nil
  end
end
