class HomeController < ApplicationController
  def index
    page_size = 20
    page = (params[:page] || 1).to_i
    skip = (page - 1) * page_size

    # fetch last activities
    ary      = Activr.activities(page_size, :skip => skip)
    total_nb = Activr.count_activities

    # paginate
    @activities = Kaminari.paginate_array(ary, :total_count => total_nb).page(page).per(page_size)
  end
end
