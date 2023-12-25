# frozen_string_literal: true

class Artwork::TagComponent < ViewComponent::Base
  def initialize(tag:, path:)
    @tag = tag
    @path = path
  end
end
