# frozen_string_literal: true

class Layout::AuthFormComponent < ViewComponent::Base
  def initialize(heading:)
    @heading = heading
  end
end
