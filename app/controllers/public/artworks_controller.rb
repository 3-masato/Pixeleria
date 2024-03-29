class Public::ArtworksController < ApplicationController
  before_action :authenticate_user!,  except: %i[index show]
  before_action :ensure_correct_user, only: %i[edit destroy editor update_canvas]
  before_action :set_artwork,         only: %i[show edit update destroy editor update_canvas]
  before_action :set_artwork_canvas,  only: %i[editor update_canvas]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  BASE_CANVAS_SIZE = 512

  def index
    if params[:tag].present?
      @tag = Tag.find_by(name: params[:tag])
      @artworks = @tag.artworks.with_publication.page(params[:page])
      @heading = t("messages.search.tags", tag: @tag.name);
    else
      @query = params[:query] || ""
      if @query == ""
        @message = t("messages.search.required_enter_query")
      else
        @artworks = Artwork.search(@query, nil).with_publication.page(params[:page])
        @message = t("messages.search.no_results_for", query: @query) if @artworks.size <= 0
        @heading = t("messages.search.result", query: @query);
      end
    end
  end

  def show
    @artwork_comments = @artwork.comments.with_user_profile_images
    @author = @artwork.user
    @authors_other_artworks = @author.artworks.with_publication.where.not(id: @artwork.id).limit(6)
  end

  def new
  end

  def edit
  end

  def initialize_editor
    @artwork = Artwork.new
    @artwork.build_artwork_canvas

    size = params[:size].split("x")
    @width = size[0].to_i
    @height = size[1].to_i
    @dotsize = calc_dotsize(@width, @height)
  end

  def editor
    @width = @artwork_canvas.width
    @height = @artwork_canvas.height
    @dotsize = calc_dotsize(@width, @height)
  end

  def update_canvas
    title = @artwork.title
    pixel_data = params[:artwork_canvas][:pixel_data]
    image_data = params[:artwork_canvas][:image_data]

    @artwork.decode_and_attach_image(image_data)

    if @artwork.save && @artwork_canvas.update(pixel_data: pixel_data)
      redirect_to artwork_path(@artwork), notice: t("messages.artwork_canvas.update_success", title: title)
    end
  end

  def create
    unique_tags = params[:artwork][:tags]&.uniq || []
    image_data = params[:artwork][:image_data]

    @artwork = Artwork.new(artwork_params)
    @artwork.tags = unique_tags
    @artwork.user = current_user

    @artwork.decode_and_attach_image(image_data)

    title = @artwork.title
    if @artwork.save
      redirect_to artwork_path(@artwork), notice: t("messages.artwork.create_succses", title: title)
    end
  end

  def update
    title = @artwork.title
    if @artwork.update(artwork_params)
      redirect_to artwork_path(@artwork), notice: t("messages.artwork.update_success", title: title)
    else
      render :edit
    end
  end

  def destroy
    title = @artwork.title
    @artwork.destroy
    redirect_to root_path, notice: t("messages.artwork.destroy_success", title: title)
  end

  private
  def set_artwork
    @artwork = Artwork.find(params[:id])
  end

  def set_artwork_canvas
    @artwork_canvas = @artwork.artwork_canvas
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

  def ensure_correct_user
    user = Artwork.find(params[:id]).user
    unless user == current_user
      redirect_to artwork_path(params[:id])
    end
  end

  def record_not_found
    redirect_to root_path
  end

  def calc_dotsize(width, height)
    dot_ratio = [width, height].max
    dotsize = BASE_CANVAS_SIZE / dot_ratio
    dotsize
  end

  def update_artwork_and_canvas(pixel_data, image_data)
    decoded_image = decode_image(image_data)
    @artwork.image.attach(io: decoded_image, filename: "#{@artwork.title}.png")
    @artwork_canvas.update(pixel_data: pixel_data) && @artwork.save
  end
end
