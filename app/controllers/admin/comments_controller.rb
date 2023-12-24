class Admin::CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy]
  before_action :store_return_to, only: [:destroy]

  def index
    @comments = Comment.page(params[:page])
      .with_user_profile_images
      .with_artwork_images
  end

  def destroy
    @comment.destroy
    redirect_to determine_redirect_path, notice: t("messages.admin.comment.destroy_success")
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
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
    admin_comments_path
  end
end
