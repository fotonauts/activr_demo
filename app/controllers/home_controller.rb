class HomeController < ApplicationController
  def index
    # fetch last activities
    @activities = Activr.activities(50)
  end
end
