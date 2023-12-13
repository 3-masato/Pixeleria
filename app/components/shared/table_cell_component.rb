# frozen_string_literal: true

class Shared::TableCellComponent < ViewComponent::Base
  def initialize(is_header: false)
    @is_header = is_header
  end
end
