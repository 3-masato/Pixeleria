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
        class: "w-[16px] min-w-[16px] max-w-[16px] h-[16px] min-h-[16px] max-h-[16px] #{base_class}",
      },
      xxxs: {
        width: 24,
        height: 24,
        class: "w-[24px] min-w-[24px] max-w-[24px] h-[24px] min-h-[24px] max-h-[24px] #{base_class}",
      },
      xxs: {
        width: 32,
        height: 32,
        class: "w-[32px] min-w-[32px] max-w-[32px] h-[32px] min-h-[32px] max-h-[32px] #{base_class}",
      },
      xs: {
        width: 48,
        height: 48,
        class: "w-[48px] min-w-[48px] max-w-[48px] h-[48px] min-h-[48px] max-h-[48px] #{base_class}",
      },
      sm: {
        width: 64,
        height: 64,
        class: "w-[64px] min-w-[64px] max-w-[64px] h-[64px] min-h-[64px] max-h-[64px] #{base_class}",
      },
      md: {
        width: 96,
        height: 96,
        class: "w-[96px] min-w-[96px] max-w-[96px] h-[96px] min-h-[96px] max-h-[96px] #{base_class}",
      },
      lg: {
        width: 128,
        height: 128,
        class: "w-[128px] min-w-[128px] max-w-[128px] h-[128px] min-h-[128px] max-h-[128px] #{base_class}",
      },
      xl: {
        width: 192,
        height: 192,
        class: "w-[192px] min-w-[192px] max-w-[192px] h-[192px] min-h-[192px] max-h-[192px] #{base_class}",
      },
      xxl: {
        width: 256,
        height: 256,
        class: "w-[256px] min-w-[256px] max-w-[256px] h-[256px] min-h-[256px] max-h-[256px] #{base_class}",
      },
      xxxl: {
        width: 384,
        height: 384,
        class: "w-[384px] min-w-[384px] max-w-[384px] h-[384px] min-h-[384px] max-h-[384px] #{base_class}",
      },
      xxxxl: {
        width: 512,
        height: 512,
        class: "w-[512px] min-w-[512px] max-w-[512px] h-[512px] min-h-[512px] max-h-[512px] #{base_class}",
      }
    }
  end
end
