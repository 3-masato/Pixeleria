class Admin::ArtworksController < ApplicationController
  before_action :set_artwork, only: %i[show edit update destroy]

  def index
    @artworks = Artwork.with_details.page(params[:page])
  end

  def show
    @author = @artwork.user
    @author_artworks = @author.artworks.with_details.page(params[:page])
    @artwork_comments = @artwork.comments.page(params[:page])
      .with_user_profile_images
      .with_artwork_images
  end

  def edit
    @tag_array = @artwork.tags.map(&:name)
    @tag_list = @artwork.tags.map(&:name).join(",")
  end

  def update
    p params
    # tag_list = params[:artwork][:tag_list]
    # tags = params[:artwork][:tags]
    title = @artwork.title
    if @artwork.update(artwork_params)
      # @artwork.save_tags(tag_list.split(",").map(&:strip))
      # @artwork.save_tags(tags)
      redirect_to admin_artwork_path(@artwork), notice: t("messages.admin.artwork.update_success", title: title)
    else
    end
  end

  def destroy
    title = @artwork.title
    @artwork.destroy
    redirect_to admin_artworks_path, notice: t("messages.admin.artwork.destroy_success", title: title)
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
      :tags => []
    )
  end
end
