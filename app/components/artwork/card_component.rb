# frozen_string_literal: true

class Artwork::CardComponent < ViewComponent::Base
  attr_reader :artwork, :current_user

  def initialize(artwork:, current_user:)
    @artwork = artwork
    @current_user = current_user
  end
end
