# frozen_string_literal: true

class Shared::Form::SelectComponent < ViewComponent::Base
  attr_reader :form, :field_name, :choices, :selected, :size, :disabled

  def initialize(form:, field_name:, choices:, selected: nil, size: :medium, disabled: false)
    @form = form
    @field_name = field_name
    @choices = choices
    @selected = selected
    @size = size
    @disabled = disabled
  end

  def select_classes
    classes = "block py-2.5 px-3 w-full border-gray-200 rounded-sm text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none"
    classes += " text-lg" if @size == :large
    classes += " text-md" if @size == :medium
    classes += " text-sm" if @size == :small
    classes
  end
end
