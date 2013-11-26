class HomeController < ApplicationController
  def index
    # fetch last activities
    @activities = Activr.activities(20)
  end
end
