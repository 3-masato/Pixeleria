# frozen_string_literal: true

class Shared::DetailsRowComponent < ViewComponent::Base
  attr_reader :heading

  def initialize(heading:)
    @heading = heading
  end
end
