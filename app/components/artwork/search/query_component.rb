# frozen_string_literal: true

class Artwork::Search::QueryComponent < ViewComponent::Base
  attr_reader :form

  def initialize(form:)
    @form = form
  end
end
