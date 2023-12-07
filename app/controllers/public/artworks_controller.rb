class Public::ArtworksController < ApplicationController
  before_action :authenticate_user!

  BASE_CANVAS_SIZE = 768

  def index
  end

  def show
  end

  def edit
  end

  def new
    @artwork = Artwork.new
  end

  def initialize_editor
    size = params[:size].split("x")
    @width = size[0].to_i
    @height = size[1].to_i
    @dotsize = BASE_CANVAS_SIZE / @width
  end

  def update
  end

  def create
  end

  def destroy
  end
end
