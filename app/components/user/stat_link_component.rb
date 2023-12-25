# frozen_string_literal: true

class User::StatLinkComponent < ViewComponent::Base
  def initialize(user:, stat_type:, count:)
    @user = user
    @stat_type = stat_type
    @count = count
  end

  def stat_path
    case @stat_type
    when :followers
      user_followers_path(@user.account_name)
    when :followings
      user_followings_path(@user.account_name)
    when :artworks
      user_artworks_path(@user.account_name)
    end
  end

  def stat_label
    t("user.#{@stat_type}")
  end

  def count_id
    "#{@stat_type}-count-of-#{@user.account_name}"
  end
end
