# frozen_string_literal: true

class Shared::TextFieldComponent < ViewComponent::Base
  attr_reader :form, :field_type, :field_name, :options

  def initialize(form:, field_type:, field_name:, size: :default, **options)
    @form = form
    @field_type = field_type
    @field_name = field_name
    @size = size
    @options = options.merge(class: base_class)
  end

  private

  def base_class
    classes = "block w-full border-gray-200 rounded-sm text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none"
    classes += " py-3 px-4" if @size == :default
    classes += " sm:p-5" if @size == :large
    classes += " py-2 px-3" if @size == :small
    classes += " p-4" if @size == :medium
    classes
  end
end
