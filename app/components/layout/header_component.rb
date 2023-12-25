# frozen_string_literal: true

class Layout::HeaderComponent < ViewComponent::Base
  def initialize(admin_signed_in:, nav_items:)
    @admin_signed_in = admin_signed_in
    @nav_items = nav_items
  end
end
