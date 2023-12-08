class Public::UsersController < ApplicationController
  def edit
  end

  def show
    @user = User.find_by(account_name: params[:account_name])
  end

  def update
  end

  def confirm_deactivation
  end

  def deactivate
  end
end
