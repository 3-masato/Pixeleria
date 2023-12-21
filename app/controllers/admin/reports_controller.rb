class Admin::ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update update_status]

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

  def update_status
    if @report.update(status: params[:status])
      respond_to do |format|
        format.js
      end
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
