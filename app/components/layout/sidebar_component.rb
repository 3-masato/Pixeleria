# frozen_string_literal: true

class Layout::SidebarComponent < ViewComponent::Base
  def initialize(admin_signed_in:, items:)
    @admin_signed_in = admin_signed_in
    @items = items
  end
end
