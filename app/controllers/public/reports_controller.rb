class Public::ReportsController < ApplicationController
  def make
    target = params[:target]
    unless target == "user" || target == "artwork" || target == "comment"
      # TODO: 想定外の通報種類がリクエストされたときの挙動
      head :no_content
    end

    @report = Report.new
    @target = target
    @target_id = params[:target_id]
  end

  def create
    target = params[:report][:target]
    target_id = params[:report][:target_id]
    @reportable = target.capitalize.constantize.find_by(id: target_id)
    if @reportable
      @report = @reportable.reports.new(report_params)
      @report.reported_by_user = current_user

      @report.save
      flash.now[:notice] = t("messages.report.submit_success")
    end
  end

  private
  def report_params
    params.require(:report).permit(:reason, :description)
  end
end
