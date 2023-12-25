# frozen_string_literal: true

class Shared::Form::TextAreaComponent < ViewComponent::Base
  attr_reader :form, :field_name, :rows, :placeholder, :readonly, :disabled

  def initialize(form:, field_name:, rows:, size: :medium, **option)
    @form = form
    @field_name = field_name
    @rows = rows
    @size = size
    @option = option
  end

  def textarea_classes
    classes = "block py-2.5 px-3 w-full border-gray-200 rounded-sm text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none"
    classes += " text-md" if @size == :large
    classes += " text-sm" if @size == :medium
    classes += " text-xs" if @size == :small
    classes
  end
end
