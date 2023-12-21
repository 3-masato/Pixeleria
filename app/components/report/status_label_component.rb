# frozen_string_literal: true

class Report::StatusLabelComponent < ViewComponent::Base
  def initialize(status:, text:)
    @status = status
    @text = text
  end

  def per_status_badge
    case @status
    when 0
      # pending / 未着手
      # 注意や待機を表すため `yellow` を使う
      Shared::BadgeComponent.new(color: :yellow, large: false, border: true, rounded: true)
    when 1
      # processing / 処理中
      # 進行中や作業中の状態を暗示するため `orange` を使う
      Shared::BadgeComponent.new(color: :orange, large: false, border: true, rounded: true)
    when 2
      # resolved / 解決済
      # 完成や解決を示すため `green` を使う
      Shared::BadgeComponent.new(color: :green, large: false, border: true, rounded: true)
    else
      # other
      # エラー防止用、通常は使用しない
      Shared::BadgeComponent.new(color: :none, large: false, border: true, rounded: true)
    end
  end
end
