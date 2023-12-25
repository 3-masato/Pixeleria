# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_deactive_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: t("devise.sessions.guest_signed_in")
  end

  protected
  # ユーザーステータスが退会もしくは凍結の状態を非アクティブとする。
  # 非アクティブのユーザーをログインさせず、メッセージを表示する。
  def reject_deactive_user
    @user = User.find_by(email: params[:user][:email])

    # ユーザーが存在しない、またはアクティブでない場合は処理を終了
    return unless @user && @user.valid_password?(params[:user][:password]) && !@user.active_for_authentication?

    # ユーザーステータスに応じたメッセージを設定し、ログイン画面にリダイレクト
    case @user.status
    when "deactivated"
      flash_message = :deactivated
    when "suspended"
      flash_message = :suspended
    else
      return
    end

    set_flash_message!(:alert, flash_message, scope: "devise.failure")
    redirect_to new_user_session_path
  end
end
