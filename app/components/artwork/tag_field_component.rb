# frozen_string_literal: true

class Artwork::TagFieldComponent < ViewComponent::Base
  def initialize(form:, value:, index:)
    @form = form
    @value = value
    @index = index
  end
end
