# frozen_string_literal: true

class Interaction::FollowButtonComponent < ViewComponent::Base
  def initialize(user:, current_user:)
    @current_user = current_user
    @user = user
  end

  def should_render?
    @current_user.present? && @current_user != @user
  end

  def button_properties
    if @current_user.following?(@user)
      {
        path: user_unfollow_path(@user.account_name),
        method: :delete,
        text: t("user.unfollow"),
        style: :outline,
        color: :red
      }
    else
      {
        path: user_follow_path(@user.account_name),
        method: :post,
        text: t("user.follow"),
        style: :outline,
        color: :sky
      }
    end
  end
end
