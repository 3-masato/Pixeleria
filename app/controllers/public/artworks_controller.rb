class Public::ArtworksController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_artwork, only: %i[show edit update destroy]

  # ドット絵のサイズいずれでも割り切れるきりの良い数
  BASE_CANVAS_SIZE = 640

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
    @artwork_comments = @artwork.comments.with_user_profile_images
    @author = @artwork.user
    @authors_other_artworks = @author.artworks.with_publication.where.not(id: @artwork.id)
  end

  def edit
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

  def create
    image_data = params[:artwork][:image_data]
    decoded_image = decode_image(image_data)
    unique_tags = params[:artwork][:tags].uniq
    @artwork = Artwork.new(artwork_params)
    @artwork.tags = unique_tags
    @artwork.user = current_user
    @artwork.image.attach(io: decoded_image, filename: "#{@artwork.title}.png")

    if @artwork.save
      p "saved"
      redirect_to artwork_path(@artwork)
    else
      p "failed"
      p @artwork.errors
      # render :new
    end
  end

  def initialize_editor
    @artwork_id = nil
    size = params[:size].split("x")
    @width = size[0].to_i
    @height = size[1].to_i
    dot_ratio = [@width, @height].max
    @dotsize = BASE_CANVAS_SIZE / dot_ratio
    @artwork = Artwork.new
    @artwork.build_artwork_canvas
  end

  def update
    p params
    p artwork_params
    title = @artwork.title
    if @artwork.update(artwork_params)
      redirect_to artwork_path(@artwork), notice: t("messages.admin.artwork.update_success", title: title)
    else
      render :new
    end
  end

  def destroy
    @artwork.destroy
    redirect_to root_path
  end

  private
  def set_artwork
    @artwork = Artwork.find(params[:id])
  end

  def artwork_params
    params.require(:artwork).permit(
      :title,
      :description,
      :is_public,
      :artwork_canvas_attributes => %i[pixel_data width height],
      :tags => []
    )
  end

  def decode_image(data)
    # Base64のプレフィックスを削除し、デコードする
    base64_image = data.sub(/^data:image\/\w+;base64,/, "")
    decoded_image = Base64.decode64(base64_image)
    StringIO.new(decoded_image)
  end
end
