class Admin::ArtworksController < ApplicationController
  def index
    @artworks = Artwork.with_details.page(params[:page])
  end

  def show
    @artwork = Artwork.find(params[:id])
    @author = @artwork.user
    @author_artworks = @author.artworks.with_details.page(params[:page])
  end
end
