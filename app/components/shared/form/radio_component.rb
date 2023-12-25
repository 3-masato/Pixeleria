# frozen_string_literal: true

class Shared::Form::RadioComponent < ViewComponent::Base
  attr_reader :form, :field_name, :value, :label_field, :label_text, :checked

  def initialize(form:, field_name:, value:, label_field:, label_text:, checked: false)
    @form = form
    @field_name = field_name
    @value = value
    @label_field = label_field
    @label_text = label_text
    @checked = checked
  end

  def radio_button_classes
    "shrink-0 mt-0.5 border-gray-200 rounded-full text-blue-600 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none"
  end
end
