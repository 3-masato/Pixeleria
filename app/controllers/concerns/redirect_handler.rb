module RedirectHandler
  extend ActiveSupport::Concern

  private

  def store_return_to
    session[:return_to] = params[:return_to] if params[:return_to].present?
  end

  def determine_redirect_path(default_path)
    return session.delete(:return_to) if session[:return_to].present?
    default_path
  end
end
