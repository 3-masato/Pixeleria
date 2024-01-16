# frozen_string_literal: true

class User::Search::FormComponent < ViewComponent::Base
  attr_reader :options

  def initialize(options:)
    @options = options
  end
end
