class Admin::ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update]

  def index
    @reports = Report.page(params[:page])
  end

  def show
    # @report.update(is_read: true)
  end

  def edit
  end

  def update
    if @report.update(report_params)
    else
    end
  end

  private
  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:status)
  end
end
