class Public::CommentsController < ApplicationController
  before_action :ensure_correct_user, only: :destroy
  before_action :set_artwork, only: %i[create destroy]

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
  def set_artwork
    @artwork = Artwork.find(params[:artwork_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def ensure_correct_user
    user = Comment.find(params[:id]).user
    unless user == current_user
      redirect_to request.referer
    end
  end
end
