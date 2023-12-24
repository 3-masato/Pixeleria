# frozen_string_literal: true

class Shared::Table::HeaderComponent < ViewComponent::Base
  def initialize(headers:)
    @headers = headers
  end
end
