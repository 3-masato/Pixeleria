class Public::RelationshipsController < ApplicationController
  before_action :set_user, only: [:create, :destroy, :followings, :followers]

  def create
    current_user.follow(@user)
  end

  def destroy
    current_user.unfollow(@user)
  end

  def followings
    @followings = @user.followings
  end

  def followers
    @followers = @user.followers
  end

  def set_user
    @user = User.find_by(account_name: params[:account_name])
  end
end
