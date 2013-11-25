class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show ]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def follow
    @user = User.find(params[:id])
    if (current_user != @user) && !current_user.follow?(@user)
      current_user.follow!(@user)

      # dispatch activity
      Activr.dispatch!(FollowBuddyActivity.new(:actor => current_user, :buddy => @user))
    end

    redirect_to @user
  end

  def unfollow
    @user = User.find(params[:id])
    if current_user.follow?(@user)
      current_user.unfollow!(@user)
    end

    redirect_to @user
  end
end
