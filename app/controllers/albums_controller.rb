class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def follow
    @album = Album.find(params[:id])
    if user_signed_in? && (current_user != @album.owner) && !current_user.follow_album?(@album)
      current_user.follow_album!(@album)
    end

    redirect_to @album
  end

  def unfollow
    @album = Album.find(params[:id])
    if user_signed_in? && current_user.follow_album?(@album)
      current_user.unfollow_album!(@album)
    end

    redirect_to @album
  end
end
