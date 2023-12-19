# frozen_string_literal: true

class Shared::FileInputComponent < ViewComponent::Base
  def initialize(form:, field_name:, **options)
    @form = form
    @field_name = field_name
    @options = options
  end
end
