class Public::UsersController < ApplicationController
  before_action :ensure_correct_user, only: %i[edit update]
  before_action :ensure_guest_user, only: %i[confirm_deactivation deactivate]
  before_action :set_user, only: %i[edit show update artworks my_artworks liked_artworks]

  def edit
  end

  def show
    @user_artworks = @user.artworks.with_publication.page(params[:page])
  end

  def update
    if @user.update(user_params)
      redirect_to user_profile_path(@user.account_name), notice: t("messages.user.profile.update_success")
    else
      render :edit
    end
  end

  def my_artworks
    @artworks = @user.artworks.with_details.page(params[:page])
  end

  def confirm_deactivation
    @user = current_user
  end

  def deactivate
    deactivate_related_content
    reset_session
    redirect_to root_path, notice: t("messages.user.delete_account.success")
  end

  def artworks
    @user_artworks = @user.artworks.with_publication.page(params[:page])
  end

  def liked_artworks
    @user_liked_artworks = @user.liked_artworks.with_publication.page(params[:page])
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

  def ensure_correct_user
    user = User.find_by(account_name: params[:account_name])
    unless user == current_user
      redirect_to user_profile_path(user.account_name)
    end
  end

  def ensure_guest_user
    user = current_user
    if user.is_guest
      redirect_to user_profile_path(user.account_name)
    end
  end

  # ユーザーステータスを `退会` にして、
  # 投稿作品、いいね、コメント、フォロー・フォロワーを全て削除する
  def deactivate_related_content
    user = current_user
    user.update(status: 1)
    user.artworks.destroy_all
    user.likes.destroy_all
    user.comments.destroy_all
    user.active_relationships.destroy_all
    user.passive_relationships.destroy_all
  end
end
