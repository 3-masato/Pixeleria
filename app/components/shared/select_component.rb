# frozen_string_literal: true

class Shared::SelectComponent < ViewComponent::Base
  attr_reader :form, :field_name, :choices, :selected, :size, :disabled
  
  def initialize(form:, field_name:, choices:, selected: nil, size: :default, disabled: false)
    @form = form
    @field_name = field_name
    @choices = choices
    @selected = selected
    @size = size
    @disabled = disabled
  end

  def select_classes
    classes = "pe-9 block w-full border-gray-200 rounded-sm text-sm focus:border-blue-500 focus:ring-blue-500 disabled:opacity-50 disabled:pointer-events-none"
    classes += " py-3 px-4" if @size == :default
    classes += " sm:p-5" if @size == :large
    classes += " py-2 px-3" if @size == :small
    classes += " p-4" if @size == :medium
    classes
  end
end
