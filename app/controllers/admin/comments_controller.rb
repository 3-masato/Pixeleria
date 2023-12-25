class Admin::CommentsController < ApplicationController
  # `RedirectHandler` モジュールのインクルード
  # このモジュールはリダイレクトに関する共通のメソッドを提供します。
  # 特定のアクション実行後、元のページに戻るための処理をサポートします。
  include RedirectHandler

  before_action :set_comment, only: %i[destroy]
  before_action :store_return_to, only: [:destroy]

  def index
    @comments = Comment.page(params[:page])
      .with_user_profile_images
      .with_artwork_images
  end

  def destroy
    @comment.destroy

    default_path = admin_comments_path
    notice = t("messages.admin.comment.destroy_success")

    redirect_to determine_redirect_path(default_path), notice: notice
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end
end
