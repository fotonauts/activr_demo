class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def follow
    @user = User.find(params[:id])
    if user_signed_in? && (current_user != @user) && !current_user.follow?(@user)
      current_user.follow!(@user)
    end

    redirect_to @user
  end

  def unfollow
    @user = User.find(params[:id])
    if user_signed_in? && current_user.follow?(@user)
      current_user.unfollow!(@user)
    end

    redirect_to @user
  end
end
