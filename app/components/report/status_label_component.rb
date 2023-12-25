# frozen_string_literal: true

class Report::StatusLabelComponent < ViewComponent::Base
  def initialize(report:, type: :static)
    @report = report
    @type = type
  end

  def per_status_badge
    case @report.status_before_type_cast
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

  def fa_class
    case @report.status_before_type_cast
    when 0
      "fa-regular fa-hourglass-half"
    when 1
      "fa-solid fa-arrows-spin"
    when 2
      "fa-solid fa-check"
    else
      "fa-solid fa-minus"
    end
  end

  def report_status_options
    Report.statuses.map do |key, _value|
      [t("enums.report.status.#{key}"), key]
    end
  end
end
