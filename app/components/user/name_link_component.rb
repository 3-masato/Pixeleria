# frozen_string_literal: true

class User::NameLinkComponent < ViewComponent::Base
  attr_reader :user

  def initialize(user:, size:)
    @user = user
    @size = size
  end

  def display_name_class
    classes = text_sizes[0]
    classes += " font-bold no-underline hover:text-blue-500 hover:underline"
    classes
  end

  def account_name_class
    classes = text_sizes[1]
    classes += " text-gray-500"
    classes
  end

  private
  def text_sizes
    case @size
    when :xl
      ["text-xl", "text-lg"]
    when :lg
      ["text-lg", "text-md"]
    when :md
      ["text-md", "text-sm"]
    when :sm
      ["text-sm", "text-xs"]
    end
  end
end
