class AlbumsController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show ]

  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])

    # fetch last activities
    @activities = @album.activities(20)
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

  def new_photo
    @album = Album.find(params[:id])
    if (current_user != @album.owner)
      flash[:error] = "You are not the owner of album: '#{@album.name}'"
      redirect_to @album
    else
      @picture = Picture.new
    end
  end

  def create_photo
    @album = Album.find(params[:id])
    if (current_user != @album.owner)
      flash[:error] = "You are not the owner of album: '#{@album.name}'"
      redirect_to @album
    else
      # create picture
      picture = Picture.create!(picture_params)

      # add picture to album
      @album.add_picture(picture, current_user)

      flash[:success] = "Photo '#{picture.title}' added to album: '#{@album.name}'"
      redirect_to @album
    end
  end


  private

  def album_params
    params.require(:album).permit(:name)
  end

  def picture_params
    params.require(:picture).permit(:title, :image)
  end
end
