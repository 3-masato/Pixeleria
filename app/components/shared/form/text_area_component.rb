# frozen_string_literal: true

class Shared::Form::TextAreaComponent < ViewComponent::Base
  attr_reader :form, :field_name, :rows, :placeholder, :readonly, :disabled

  def initialize(form:, field_name:, rows:, size: :default, **option)
    @form = form
    @field_name = field_name
    @rows = rows
    @size = size
    @option = option
  end

  def textarea_classes
    classes = "py-3 px-4 block w-full border-gray-200 rounded-sm text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none"
    classes += " sm:p-5" if @size == :large
    classes += " py-2 px-3" if @size == :small
    classes
  end
end
