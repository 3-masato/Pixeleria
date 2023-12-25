# このモジュールは、リダイレクト処理に関連する共通の機能を提供します。
# 特定のアクション後に指定したパスにリダイレクトする際に使用します。
module RedirectHandler
  extend ActiveSupport::Concern

  private
  # 指定したパスにリダイレクトする必要がある場合、そのパスをセッションに保存します。
  # このメソッドは、特定のアクションにリダイレクトされる前に実行されることを想定しています。
  def store_return_to
    session[:return_to] = params[:return_to] if params[:return_to].present?
  end

  # セッションに保存されたリダイレクト先が存在する場合、そのパスを返します。
  # 存在しない場合は、指定されたデフォルトパスにリダイレクトします。
  def determine_redirect_path(default_path)
    return session.delete(:return_to) if session[:return_to].present?
    default_path
  end
end
