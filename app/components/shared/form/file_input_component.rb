# frozen_string_literal: true

class Shared::Form::FileInputComponent < ViewComponent::Base
  def initialize(form:, field_name:, image: nil, **options)
    @form = form
    @field_name = field_name
    @image = image
    @options = options
  end
end
