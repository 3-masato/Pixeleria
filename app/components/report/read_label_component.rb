# frozen_string_literal: true

class Report::ReadLabelComponent < ViewComponent::Base
  def initialize(is_read:)
    @is_read = is_read
  end

  def label_text
    t("report.#{@is_read ? "read" : "unread"}")
  end

  def badge_color
    @is_read ? :blue : :red
  end

  def fa_class
    @is_read ? "fa-solid fa-envelope-open" : "fa-solid fa-envelope"
  end
end
