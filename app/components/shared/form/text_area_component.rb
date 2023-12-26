# frozen_string_literal: true

class Shared::Form::TextAreaComponent < ViewComponent::Base
  attr_reader :form, :field_name, :rows, :errors, :options

  def initialize(form:, field_name:, rows:, size: :medium, model: nil, **options)
    @form = form
    @field_name = field_name
    @rows = rows
    @size = size
    @model = model
    @errors = model.nil? ? nil : model.errors.full_messages_for(field_name)
    @options = options
  end

  def textarea_classes
    classes = "block py-2.5 px-4 w-full rounded-sm disabled:opacity-50 disabled:pointer-events-none"
    classes += @errors.present? ? " border-red-500 outline-red-500 focus:border-red-500 focus:ring-red-500" : " border-gray-200 focus:border-blue-500 focus:ring-blue-500"
    classes += " text-md" if @size == :large
    classes += " text-sm" if @size == :medium
    classes += " text-xs" if @size == :small
    classes
  end
end
