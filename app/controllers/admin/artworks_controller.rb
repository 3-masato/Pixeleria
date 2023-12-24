class Admin::ArtworksController < ApplicationController
  # `RedirectHandler` モジュールのインクルード
  # このモジュールはリダイレクトに関する共通のメソッドを提供します。
  # 特定のアクション実行後、元のページに戻るための処理をサポートします。
  include RedirectHandler

  before_action :set_artwork, only: %i[show edit update destroy]
  before_action :store_return_to, only: %i[edit destroy]

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
    title = @artwork.title
    if @artwork.update(artwork_params)
      default_path = admin_artwork_path(@artwork)
      notice = t("messages.artwork.update_success", title: title)

      redirect_to determine_redirect_path(default_path), notice: notice
    else
    end
  end

  def destroy
    title = @artwork.title
    @artwork.destroy

    default_path = admin_artworks_path
    notice = t("messages.artwork.destroy_success", title: title)

    redirect_to determine_redirect_path(default_path), notice: notice
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
