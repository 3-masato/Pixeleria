# frozen_string_literal: true

class Shared::Form::TextFieldComponent < ViewComponent::Base
  attr_reader :form, :field_type, :field_name, :errors, :options

  def initialize(form:, field_type:, field_name:, size: :medium, model: nil, **options)
    @form = form
    @field_type = field_type
    @field_name = field_name
    @size = size
    @model = model
    @errors = model.nil? ? nil : model.errors.full_messages_for(field_name)
    @options = options.merge(class: base_class)
  end

  private

  def base_class
    classes = "block py-2.5 px-3 w-full border-gray-200 rounded-sm disabled:opacity-50 disabled:pointer-events-none"
    classes += @errors.present? ? " outline-red-500 focus:border-red-500 focus:ring-red-500" : " focus:border-blue-500 focus:ring-blue-500"
    classes += " text-lg" if @size == :large
    classes += " text-md" if @size == :medium
    classes += " text-sm" if @size == :small
    classes
  end
end
