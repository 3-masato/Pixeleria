# frozen_string_literal: true

class User::StatusLabelComponent < ViewComponent::Base
  def initialize(status:, text:)
    @status = status
    @text = text
  end

  def per_status_badge
    case @status
    when 0
      Shared::BadgeComponent.new(color: :sky, large: false, border: true, rounded: true)
    when 1
      Shared::BadgeComponent.new(color: :gray, large: false, border: true, rounded: true)
    when 2
      Shared::BadgeComponent.new(color: :red, large: false, border: true, rounded: true)
    else
      Shared::BadgeComponent.new(color: :none, large: false, border: true, rounded: true)
    end
  end
end
