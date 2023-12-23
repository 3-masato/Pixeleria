# frozen_string_literal: true

class Shared::Form::TextFieldComponent < ViewComponent::Base
  attr_reader :form, :field_type, :field_name, :errors, :options

  def initialize(form:, field_type:, field_name:, size: :default, model: nil, **options)
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
    classes = "block w-full border-gray-200 rounded-sm text-sm disabled:opacity-50 disabled:pointer-events-none"
    classes += @errors.present? ? " outline-red-500 focus:border-red-500 focus:ring-red-500" : " focus:border-blue-500 focus:ring-blue-500"
    classes += " py-3 px-4" if @size == :default
    classes += " sm:p-5" if @size == :large
    classes += " py-2 px-3" if @size == :small
    classes += " p-4" if @size == :medium
    classes
  end
end
