# frozen_string_literal: true

class Shared::Form::LabelComponent < ViewComponent::Base
  def initialize(form:, field:, text: nil, class_name: "")
    @form = form
    @field = field
    @text = text
    @class_name = class_name
  end
end
