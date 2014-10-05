class DashboardController < ApplicationController
  def index
    @doorbots = Doorbot.all
  end
end
