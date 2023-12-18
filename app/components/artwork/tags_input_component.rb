# frozen_string_literal: true

class Artwork::TagsInputComponent < ViewComponent::Base
  def initialize(form:, tags:, label:)
    @form = form
    @tags = tags
    @label = label
  end
end
