class Admin::ReportsController < ApplicationController
  def index
    @reports = Report.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
  end
end
