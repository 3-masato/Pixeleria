class Public::ArtworksController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  # ドット絵のサイズいずれでも割り切れるきりの良い数
  BASE_CANVAS_SIZE = 768

  def index
    if params[:tag].present?
      @tag = Tag.find_by(name: params[:tag])
      @artworks = @artworks = @tag.artworks.with_publication
    else
      @query = params[:query] || ""
      @artworks = @query != "" ? Artwork.search(@query) : Artwork.with_publication
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    @artwork_comments = @artwork.comments.with_user_profile_images
    @author = @artwork.user
    @authors_other_artworks = @author.artworks.with_publication.where.not(id: @artwork.id)
  end

  def edit
    @artwork = Artwork.find(params[:id])
  end

  def setup_editor
    @artwork = Artwork.find(params[:artwork_id])
    @artwork_canvas = @artwork.artwork_canvas
    @width = @artwork_canvas.width
    @height = @artwork_canvas.height
    dot_ratio = [@width, @height].max
    @dotsize = BASE_CANVAS_SIZE / dot_ratio
  end

  def new
  end

  def initialize_editor
    @artwork_id = nil
    size = params[:size].split("x")
    @width = size[0].to_i
    @height = size[1].to_i
    dot_ratio = [@width, @height].max
    @dotsize = BASE_CANVAS_SIZE / dot_ratio
  end

  def save
    id = params[:artwork_id]
    image_data = params[:image_data]
    pixel_data = params[:pixel_data]
    width = params[:width]
    height = params[:height]
    decoded_image = decode_image(image_data)

    if id.nil?
      @artwork = create_new_artwork(decoded_image)
      @artwork_canvas = create_new_artwork_canvas(pixel_data, width, height, @artwork)
      log_action("saved")
    else
      @artwork = update_existing_artwork(id, decoded_image)
      @artwork_canvas = update_existing_artwork_canvas(@artwork, pixel_data)
      log_action("updated")
    end

    unless @artwork.valid? && @artwork_canvas.valid?
      render json: { status: "error" } and return
    end

    render json: { status: "ok", artwork_id: @artwork.id }
  end

  def confirm_upload
    id = params[:artwork_id]
    image_data = params[:image_data]
    pixel_data = params[:pixel_data]
    width = params[:width]
    height = params[:height]
    decoded_image = decode_image(image_data)

    if id.nil?
      @artwork = create_new_artwork(decoded_image)
      @artwork_canvas = create_new_artwork_canvas(pixel_data, width, height, @artwork)
      log_action("saved")
    else
      @artwork = update_existing_artwork(id, decoded_image)
      @artwork_canvas = update_existing_artwork_canvas(@artwork, pixel_data)
      log_action("updated")
    end

    unless @artwork.valid? && @artwork_canvas.valid?
      render json: { status: "error" } and return
    end
  end

  def update
    tag_list = params[:artwork][:tag_list]
    @artwork = Artwork.find(params[:id])

    if @artwork.update(artwork_params)
      @artwork.save_tags(tag_list.split(",").map(&:strip))
      redirect_to artwork_path(@artwork.id)
    end
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    @artwork.destroy
    redirect_to root_path
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :description, :is_public)
  end

  def decode_image(data)
    # Base64のプレフィックスを削除し、デコードする
    base64_image = data.sub(/^data:image\/\w+;base64,/, "")
    decoded_image = Base64.decode64(base64_image)
    StringIO.new(decoded_image)
  end

  def create_new_artwork(decoded_image)
    artwork = Artwork.new(title: "", is_public: false, user: current_user)
    artwork.image.attach(io: decoded_image, filename: "canvas_image.png")
    artwork.save
    artwork
  end

  def create_new_artwork_canvas(pixel_data, width, height, artwork)
    ArtworkCanvas.create(pixel_data: pixel_data, width: width, height: height, artwork: artwork)
  end

  def update_existing_artwork(id, decoded_image)
    artwork = Artwork.find(id)
    artwork.image.attach(io: decoded_image, filename: "canvas_image.png")
    artwork.save
    artwork
  end

  def update_existing_artwork_canvas(artwork, pixel_data)
    artwork_canvas = artwork.artwork_canvas
    artwork_canvas.update(pixel_data: pixel_data)
    artwork_canvas
  end

  def log_action(action)
    p "--------"
    p "#{action}"
    p "--------"
  end
end
