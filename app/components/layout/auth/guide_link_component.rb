# frozen_string_literal: true

class Layout::Auth::GuideLinkComponent < ViewComponent::Base
  def initialize(text:, path:)
    @text = text
    @path = path
  end
end
