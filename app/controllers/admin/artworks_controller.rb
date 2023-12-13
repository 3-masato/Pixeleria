class Admin::ArtworksController < ApplicationController
  def index
    @artworks = Artwork.with_details
  end

  def show
  end
end
