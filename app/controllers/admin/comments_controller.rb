class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.page(params[:page])
      .with_user_profile_images
      .with_artwork_images
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end
end
