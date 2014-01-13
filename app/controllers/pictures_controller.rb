class PicturesController < ApplicationController
  before_filter :authenticate_user!, :except => [ :index, :show ]

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])

    if user_signed_in?
      @target_albums = current_user.target_albums(@picture)
    end

    # compute pagination
    page_size = 20
    page = (params[:page] || 1).to_i
    skip = (page - 1) * page_size

    # fetch activities
    activities_ary = @picture.activities(page_size, :skip => skip)

    # paginate
    @activities = Kaminari.paginate_array(activities_ary, :total_count => @picture.activities_count).page(page).per(page_size)
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params.merge({
      :owner => current_user,
    }))

    if @picture.save
      flash[:success] = "New picture created: '#{@picture.title}'"
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  def destroy
    picture = Picture.find(params[:id])

    if picture.owner != current_user
      flash[:error] = "You don't own picture: #{picture.title}"
      redirect_to picture
    else
      picture.destroy

      flash[:success] = "Picture deleted."
      redirect_to url_for(current_user)
    end
  end

  def like
    @picture = Picture.find(params[:id])
    if (current_user != @picture) && !current_user.like?(@picture)
      current_user.like!(@picture)
    end

    redirect_to @picture
  end

  def unlike
    @picture = Picture.find(params[:id])
    if current_user.like?(@picture)
      current_user.unlike!(@picture)
    end

    redirect_to @picture
  end

  def add_to_album
    @picture = Picture.find(params[:id])
    @album = Album.find(params[:album_id])

    if @album.owner != current_user
      flash[:error] = "You don't own album: #{@album.name}"
      redirect_to @picture
    else
      @album.add_picture(@picture, current_user)
      redirect_to @picture
    end
  end


  private

  def picture_params
    params.require(:picture).permit(:title, :image)
  end
end
