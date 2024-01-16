# frozen_string_literal: true

class Shared::BackLinkComponent < ViewComponent::Base
  attr_reader :path, :text

  def initialize(path:, text:)
    @path = path
    @text = text
  end
end
