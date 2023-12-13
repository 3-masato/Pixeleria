# frozen_string_literal: true

class Interaction::CommentCountComponent < ViewComponent::Base
  def initialize(count:)
    @count = count
  end
end
