# frozen_string_literal: true

class Interaction::LikeCountComponent < ViewComponent::Base
  def initialize(count:)
    @count = count
  end
end
