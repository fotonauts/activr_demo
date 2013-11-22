class PicturesController < ApplicationController
  before_filter :authenticate_user!, :only => [ :new, :create, :like, :unlike ]

  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
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


  private

  def picture_params
    params.require(:picture).permit(:title, :image)
  end
end
