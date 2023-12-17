class Admin::ArtworksController < ApplicationController
  before_action :set_artwork, only: %i[show edit update destroy]

  def index
    @artworks = Artwork.with_details.page(params[:page])
  end

  def show
    @author = @artwork.user
    @author_artworks = @author.artworks.with_details.page(params[:page])
  end

  def edit
  end

  def update
  end

  def destroy
    title = @artwork.title
    @artwork.destroy
    redirect_to request.referer, notice: t("messages.admin.artwork.destroy_success", title: title)
  end

  private
  def set_artwork
    @artwork = Artwork.find(params[:id])
  end
end
