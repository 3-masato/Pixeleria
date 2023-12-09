class Public::HomesController < ApplicationController
  DISPLAY_NEW_ARTWORKS_COUNT = 12

  def top
    @artworks = Artwork.limit(DISPLAY_NEW_ARTWORKS_COUNT).with_details
  end

  def about
  end
end
