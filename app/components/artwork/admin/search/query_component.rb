# frozen_string_literal: true

class Artwork::Admin::Search::QueryComponent < ViewComponent::Base
  attr_reader :form

  def initialize(form:)
    @form = form
  end
end
