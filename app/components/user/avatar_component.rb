# frozen_string_literal: true

class User::AvatarComponent < ViewComponent::Base
  attr_reader :user

  def initialize(user:, size:)
    @user = user
    @size = size
  end

  def image_attributes
    base_class = "m-0 rounded-full"
    size_map(base_class)[@size]
  end

  private
  def size_map(base_class)
    {
      xxxxs: {
        width: 16,
        height: 16,
        class: base_class,
      },
      xxxs: {
        width: 24,
        height: 24,
        class: base_class,
      },
      xxs: {
        width: 32,
        height: 32,
        class: base_class,
      },
      xs: {
        width: 48,
        height: 48,
        class: base_class,
      },
      sm: {
        width: 64,
        height: 64,
        class: base_class,
      },
      md: {
        width: 96,
        height: 96,
        class: base_class,
      },
      lg: {
        width: 128,
        height: 128,
        class: base_class,
      },
      xl: {
        width: 192,
        height: 192,
        class: base_class,
      },
      xxl: {
        width: 256,
        height: 256,
        class: base_class,
      },
      xxxl: {
        width: 384,
        height: 384,
        class: base_class,
      },
      xxxxl: {
        width: 512,
        height: 512,
        class: base_class,
      }
    }
  end
end
