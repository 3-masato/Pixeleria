# frozen_string_literal: true

class Shared::CheckboxComponent < ViewComponent::Base
  attr_reader :form, :field_name, :label_text, :options

  def initialize(form:, field_name:, label_text:, **options)
    @form = form
    @field_name = field_name
    @label_text = label_text
    @options = options
  end
end
