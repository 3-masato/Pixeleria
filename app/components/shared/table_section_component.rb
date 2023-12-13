# frozen_string_literal: true

class Shared::TableSectionComponent < ViewComponent::Base
  def initialize(title:, sub_title: nil)
    @title = title
    @sub_title = sub_title
  end
end
