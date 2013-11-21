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
    end

    redirect_to @picture
  end

  def unlike
    @picture = Picture.find(params[:id])
    if user_signed_in? && current_user.like?(@picture)
      current_user.unlike!(@picture)
    end

    redirect_to @picture
  end
end
