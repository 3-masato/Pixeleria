class Public::UsersController < ApplicationController
  before_action :set_user, only: %i[edit show update artworks liked_artworks]

  def edit
  end

  def show
    @user_artworks = @user.artworks.with_details
  end

  def update
    if @user.update(user_params)
      redirect_to user_profile_path(@user.account_name), notice: t("messages.user.profile.update_success")
    else
      render :edit
    end
  end

  def confirm_deactivation
  end

  def deactivate
  end

  def artworks
    @user_artworks = @user.artworks.with_details
  end

  def liked_artworks
    @user_liked_artworks = @user.liked_artworks.with_details
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
      :profile_image
    )
  end
end
