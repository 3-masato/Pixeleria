class Public::LikesController < ApplicationController
  before_action :set_artwork, only: %i[create destroy]

  def create
    current_user.likes.create(artwork_id: @artwork.id)
  end

  def destroy
    like = current_user.likes.find_by(artwork_id: @artwork.id)

    # `like` が見つからなかった際に `NoMethodError` エラーが発生するため、ぼっち演算子を用いて対策する
    like&.destroy
  end

  private
  def set_artwork
    @artwork = Artwork.find(params[:artwork_id])
  end
end
