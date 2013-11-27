class HomeController < ApplicationController
  def index
    # compute pagination
    page_size = 20
    page = (params[:page] || 1).to_i
    skip = (page - 1) * page_size

    # fetch activities
    activities_ary = Activr.activities(page_size, :skip => skip)

    # paginate
    @activities = Kaminari.paginate_array(activities_ary, :total_count => Activr.count_activities).page(page).per(page_size)
  end
end
