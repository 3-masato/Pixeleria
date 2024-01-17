class Public::UsersController < ApplicationController
  before_action :authenticate_user!,  except: %i[index show artworks]
  before_action :ensure_correct_user, only: %i[edit update my_artworks]
  before_action :ensure_guest_user,   only: %i[confirm_deactivation deactivate]
  before_action :set_user,            only: %i[edit show update artworks my_artworks liked_artworks]

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

  def confirm_deactivation
    @user = current_user
  end

  def deactivate
    deactivate_related_content
    reset_session
    redirect_to root_path, notice: t("messages.user.delete_account.success")
  end

  # すべての作品
  def my_artworks
    @artworks = @user.artworks.with_details.page(params[:page])
  end

  # 公開済みの作品
  def artworks
    @user_artworks = @user.artworks.with_publication.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  # いいねした作品
  def liked_artworks
    @user_liked_artworks = @user.liked_artworks.with_publication.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def set_user
    @user = User.find_by(account_name: params[:account_name])
    record_not_found if @user.nil?
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
    redirect_to user_profile_path(user.account_name) unless user == current_user
  end

  def ensure_guest_user
    user = current_user
    redirect_to user_profile_path(user.account_name) if user.is_guest
  end

  def record_not_found
    redirect_to root_path
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
