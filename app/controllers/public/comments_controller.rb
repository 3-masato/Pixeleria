class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: :destroy
  before_action :set_artwork_and_comments, only: %i[create destroy]

  def create
    comment = current_user.comments.new(comment_params)
    comment.artwork_id = @artwork.id
    comment.save
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
  end

  private
  def set_artwork_and_comments
    @artwork = Artwork.find(params[:artwork_id])
    @artwork_comments = @artwork.comments.with_user_profile_images
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def ensure_correct_user
    user = Comment.find(params[:id]).user
    redirect_to request.referer unless user == current_user
  end
end
