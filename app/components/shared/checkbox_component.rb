# frozen_string_literal: true

class Shared::CheckboxComponent < ViewComponent::Base
  attr_reader :form, :field_name, :options

  def initialize(form:, field_name:, **options)
    @form = form
    @field_name = field_name
    @options = options
  end
end
