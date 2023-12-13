# frozen_string_literal: true

class Shared::TableHeaderComponent < ViewComponent::Base
  def initialize(headers:)
    @headers = headers
  end
end
