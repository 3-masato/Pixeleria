class Public::ArtworksController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  # ドット絵のサイズいずれでも割り切れるきりの良い数
  BASE_CANVAS_SIZE = 768

  def index
  end

  def show
    @artwork = Artwork.find(params[:id])
    @artwork_comments = @artwork.comments.with_user_profile_images
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

  def save
    id = params[:artworkId]

    if id == nil
      image_data = params[:image_data]
      decoded_image = decode_image(image_data)

      @artwork = Artwork.new(
        :title => "",
        :is_public => false,
        :user => current_user
      )
      @artwork.image.attach(io: decoded_image, filename: "canvas_image.png")

      unless @artwork.save
        render json: { status: "error" } and return
      end

      pixel_data = params[:pixel_data]
      width = params[:width]
      height = params[:height]

      @artwork_canvas = ArtworkCanvas.new(
        :pixel_data => pixel_data,
        :width => width,
        :height => height,
        :artwork => @artwork
      )

      unless @artwork_canvas.save
        render json: { status: "error" } and return
      end

      p "--------"
      p "saved"
      p "--------"

      render json: { status: "ok", artwork_id: @artwork.id }
    else
      image_data = params[:image_data]
      decoded_image = decode_image(image_data)

      @artwork = Artwork.find(id)
      @artwork.image.attach(io: decoded_image, filename: "canvas_image.png")

      unless @artwork.save
        render json: { status: "error" } and return
      end

      pixel_data = params[:pixel_data]
      width = params[:width]
      height = params[:height]

      @artwork_canvas = @artwork.artwork_canvas

      unless @artwork_canvas.update(:pixel_data => pixel_data)
        render json: { status: "error" } and return
      end

      p "--------"
      p "updated"
      p "--------"

      render json: { status: "ok" }
    end
  end

  def confirm_upload
  end

  def update
  end

  def create
    return

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
    @artwork = Artwork.find(params[:id])
    @artwork.destroy
    redirect_to root_path
  end

  private
  def decode_image(data)
    # Base64のプレフィックスを削除し、デコードする
    base64_image = data.sub(/^data:image\/\w+;base64,/, "")
    decoded_image = Base64.decode64(base64_image)
    StringIO.new(decoded_image)
  end
end
