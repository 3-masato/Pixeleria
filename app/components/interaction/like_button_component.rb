# frozen_string_literal: true

class Interaction::LikeButtonComponent < ViewComponent::Base
  def initialize(artwork:, current_user:)
    @artwork = artwork
    @current_user = current_user
  end

  def like_count
    @artwork.likes.size
  end

  def is_liked
    @current_user && @artwork.liked_by?(@current_user)
  end

  def group_class
    "group text-inherit no-underline duration-100 transition-[color] hover:text-rose-500"
  end

  def heart_class
    heart_base_class = "relative inline-grid place-items-center"
    heart_after_class = "after:absolute after:w-8 after:h-8 after:rounded-full after:bg-transparent after:duration-200 after:transition-[background-color]"
    heart_action_class = "group-hover:after:bg-rose-500/10 group-active:after:bg-rose-500/20"

    [
      is_liked ? "fa-solid fa-heart" : "fa-regular fa-heart",
      heart_base_class,
      heart_after_class,
      heart_action_class
    ].join(" ")
  end
end
