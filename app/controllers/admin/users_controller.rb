class Admin::UsersController < ApplicationController
  # `RedirectHandler` モジュールのインクルード
  # このモジュールはリダイレクトに関する共通のメソッドを提供します。
  # 特定のアクション実行後、元のページに戻るための処理をサポートします。
  include RedirectHandler

  before_action :set_user, only: %i[show edit update]
  before_action :store_return_to, only: [:edit]

  def index
    @users = User.with_attached_profile_image.page(params[:page])
  end

  def show
    @user_artworks = @user.artworks.with_details.page(params[:page])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      default_path = admin_user_path(@user.account_name)
      notice = t("messages.user.profile.update_success")

      redirect_to determine_redirect_path(default_path), notice: notice
    else
      # `account_name` がバリデーションエラーで空になったときに
      # `ActionController::UrlGenerationError` が発生するため、
      # 明示的に `set_user` を呼び出してエラーを回避する
      set_user
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
