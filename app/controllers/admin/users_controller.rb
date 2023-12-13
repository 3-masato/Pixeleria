class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(account_name: params[:account_name])
  end
end
