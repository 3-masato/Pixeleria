# frozen_string_literal: true

class User::AvatarComponent < ViewComponent::Base
  attr_reader :user

  def initialize(user:, size:)
    @user = user
    @size = size
  end

  def image_attributes
    base_class = "m-0 rounded-full"

    case @size
    when :xl
      {
        width: 128,
        height: 128,
        class: "w-[128px] h-[128px] #{base_class}"
      }
    when :lg
      {
        width: 96,
        height: 96,
        class: "w-[96px] h-[96px] #{base_class}"
      }
    when :md
      {
        width: 48,
        height: 48,
        class: "w-[48px] h-[48px] #{base_class}"
      }
    when :sm
      {
        width: 32,
        height: 32,
        class: "w-[32px] h-[32px] #{base_class}"
      }
    end
  end
end
