class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show ]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    # compute pagination
    page_size = 20
    page = (params[:page] || 1).to_i
    skip = (page - 1) * page_size

    # fetch and paginate activities
    activities_items = @user.activities(page_size, :skip => skip)

    @activities = Kaminari.paginate_array(activities_items, :total_count => @user.activities_count).page(page).per(page_size)

    if user_signed_in? && (current_user == @user)
      # fetch and paginate news feed entries
      news_feed_items = @user.user_news_feed(page_size, :skip => skip)

      @news_feed = Kaminari.paginate_array(news_feed_items, :total_count => @user.user_news_feed_count).page(page).per(page_size)
    end
  end

  def follow
    @user = User.find(params[:id])
    if (current_user != @user) && !current_user.follow?(@user)
      current_user.follow!(@user)
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
