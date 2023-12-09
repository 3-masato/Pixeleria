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
      :is_public => true
    )
    @artwork.user = current_user

    if @artwork.save
      @artwork_canvas = ArtworkCanvas.new(
        :pixel_data => data,
        :width => width,
        :height => height,
        :artwork => @artwork
      )

      if @artwork_canvas.save
        p "--------"
        p "saved"
        p "--------"
        redirect_to artwork_path(@artwork), notice: "Artwork was successfully created."
      else
        p "--------"
        p "failed to save of artwork_canvas"
        p "--------"
        render :new
      end
    else
      p "--------"
      p "failed to save of artwork "
      p "--------"
      render :new
    end
  end

  def destroy
  end
end
