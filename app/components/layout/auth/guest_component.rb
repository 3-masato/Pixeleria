# frozen_string_literal: true

class Layout::Auth::GuestComponent < ViewComponent::Base
  def initialize(path:)
    @path = path
  end
end
