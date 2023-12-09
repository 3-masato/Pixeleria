class Public::ArtworksController < ApplicationController
  before_action :authenticate_user!

  # ドット絵のサイズいずれでも割り切れるきりの良い数
  BASE_CANVAS_SIZE = 768

  def index
  end

  def show
    @artwork = Artwork.find(params[:id])
    @author = @artwork.user
    @authors_other_artworks = @author.artworks.with_details.where.not(id: @artwork.id)
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
    image_data = params[:image_data]
    decoded_image = decode_image(image_data)

    pixel_data = params[:pixel_data]
    width = params[:width]
    height = params[:height]

    @artwork = Artwork.new(
      :title => "test",
      :is_public => true
    )
    @artwork.user = current_user
    @artwork.image.attach(io: decoded_image, filename: 'canvas_image.png')

    if @artwork.save
      @artwork_canvas = ArtworkCanvas.new(
        :pixel_data => pixel_data,
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

  private
  def decode_image(data)
    # Base64のプレフィックスを削除し、デコードする
    base64_image = data.sub(/^data:image\/\w+;base64,/, "")
    decoded_image = Base64.decode64(base64_image)
    StringIO.new(decoded_image)
  end
end
