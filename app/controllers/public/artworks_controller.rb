class Public::ArtworksController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def edit
  end

  def new
    @artwork = Artwork.new
  end

  def update
  end

  def create
  end

  def destroy
  end
end
