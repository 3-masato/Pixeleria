# frozen_string_literal: true

class Shared::TextFieldComponent < ViewComponent::Base
  attr_reader :form, :field_type, :field_name, :options

  def initialize(form:, field_type:, field_name:, **options)
    @form = form
    @field_type = field_type
    @field_name = field_name
    @options = options.merge(class: base_class)
  end

  private

  def base_class
    "py-3 px-4 block w-full border-gray-200 rounded-sm text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none"
  end
end
