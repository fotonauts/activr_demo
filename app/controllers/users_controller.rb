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

      flash[:success] = "You are now following #{@user.fullname}"
    end

    redirect_to @user
  end

  def unfollow
    @user = User.find(params[:id])
    if user_signed_in? && current_user.follow?(@user)
      current_user.unfollow!(@user)

      flash[:success] = "You are not following #{@user.fullname} anymore"
    end

    redirect_to @user
  end
end
