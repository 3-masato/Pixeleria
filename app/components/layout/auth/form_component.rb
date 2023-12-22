# frozen_string_literal: true

class Layout::Auth::FormComponent < ViewComponent::Base
  def initialize(heading:)
    @heading = heading
  end
end
