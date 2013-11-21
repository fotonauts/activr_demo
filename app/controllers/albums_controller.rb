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

      flash[:success] = "You are now following the album #{@album.name}"
    end

    redirect_to @album
  end

  def unfollow
    @album = Album.find(params[:id])
    if user_signed_in? && current_user.follow_album?(@album)
      current_user.unfollow_album!(@album)

      flash[:success] = "You are not following the album #{@album.name} anymore"
    end

    redirect_to @album
  end
end
