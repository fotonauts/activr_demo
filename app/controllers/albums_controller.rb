class AlbumsController < ApplicationController
  before_filter :authenticate_user!, :only => [ :new, :create, :follow, :unfollow ]

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params.merge({
      :owner => current_user,
    }))

    if @album.save
      flash[:success] = "New album created: '#{@album.name}'"
      redirect_to albums_path
    else
      render 'new'
    end
  end

  def follow
    @album = Album.find(params[:id])
    if (current_user != @album.owner) && !current_user.follow_album?(@album)
      current_user.follow_album!(@album)
    end

    redirect_to @album
  end

  def unfollow
    @album = Album.find(params[:id])
    if current_user.follow_album?(@album)
      current_user.unfollow_album!(@album)
    end

    redirect_to @album
  end


  private

  def album_params
    params.require(:album).permit(:name)
  end
end
