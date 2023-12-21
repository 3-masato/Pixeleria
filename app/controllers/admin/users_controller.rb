class Admin::UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  before_action :store_return_to, only: [:edit]

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
      redirect_to determine_redirect_path, notice: t("messages.user.profile.update_success")
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

  def store_return_to
    # `params[:return_to]` が提供されている場合、それをセッションに保存します。
    # これは通常、特定のページから編集画面にリンクする際に設定されます。
    session[:return_to] = params[:return_to] if params[:return_to].present?
  end

  def determine_redirect_path
    # セッションに保存されたリダイレクト先が存在する場合は、そのパスを返します。
    # 存在しない場合は、デフォルトでユーザーの詳細画面にリダイレクトします。
    return session.delete(:return_to) if session[:return_to].present?
    admin_user_path(@user.account_name)
  end
end
