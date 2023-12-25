class Admin::HomesController < ApplicationController
  def top
    @unread_reports = Report.where(is_read: false)
  end
end
