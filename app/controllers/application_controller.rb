class ApplicationController < ActionController::Base
  before_action :authenticate_admin!, if: :admin_scope?

  protected

  # 管理者ユーザーがログインしていない場合はルートパスにリダイレクト
  def authenticate_admin!
    redirect_to root_path unless current_admin
  end

  # 管理者用のスコープ内にいるかを判定
  # 管理者ログインページでは認証をスキップ
  def admin_scope?
    in_admin_scope? && not_admin_login_page?
  end

  # 現在のパスが/adminを含むかどうか
  def in_admin_scope?
    request.fullpath.include?("/admin")
  end

  # 現在のパスが管理者ログインページ(/admin/sign_in)でないかどうか
  def not_admin_login_page?
    !request.fullpath.include?("/admin/sign_in")
  end
end
