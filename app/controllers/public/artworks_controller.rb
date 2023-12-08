class Public::ArtworksController < ApplicationController
  before_action :authenticate_user!

  # ドット絵のサイズいずれでも割り切れるきりの良い数
  # 256x256 のドット絵なら 1ドットが3px
  BASE_CANVAS_SIZE = 768

  def index
  end

  def show
    @artwork = Artwork.find(params[:id])
    @author = @artwork.user
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
    dot_ratio = [@width, @height].max
    @dotsize = BASE_CANVAS_SIZE / dot_ratio
  end

  def update
  end

  def create
    data = params[:artwork]
    width = params[:width]
    height = params[:height]

    @artwork = Artwork.new(
      :title => "test",
      :is_public => true,
      :pixel_data => data,
      :width => width,
      :height => height,
      :user_id => current_user.id
    )

    if @artwork.save
      redirect_to artwork_path(@artwork), notice: "saved"
    else
      # TODO
      # render :new
    end
  end

  def destroy
  end
end
