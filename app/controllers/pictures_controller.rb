class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def like
    @picture = Picture.find(params[:id])
    if user_signed_in? && (current_user != @picture) && !current_user.like?(@picture)
      current_user.like!(@picture)

      flash[:success] = "You liked photo '#{@picture.title}'"
    end

    redirect_to @picture
  end

  def unlike
    @picture = Picture.find(params[:id])
    if user_signed_in? && current_user.like?(@picture)
      current_user.unlike!(@picture)

      flash[:success] = "You don't like photo '#{@picture.title}' anymore"
    end

    redirect_to @picture
  end
end
