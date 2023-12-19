class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def index
    @users = User.page(params[:page])
  end

  def show
    @user_artworks = @user.artworks.with_details.page(params[:page])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user.account_name), notice: t("messages.user.profile.update_success")
    else
      render :edit
    end
  end

  private
  def set_user
    @user = User.find_by(account_name: params[:account_name])
  end

  def user_params
    params.require(:user).permit(
      :display_name,
      :account_name,
      :introduction,
      :profile_image,
      :status
    )
  end
end
