class DoorbotsController < ApplicationController
  respond_to :html
  before_action :set_doorbot, only: [:show, :edit, :update, :destroy]

  def index
    @doorbots = Doorbot.all
    authorize @doorbots
    respond_with(@doorbots)
  end

  def show
    authorize @doorbot
    @access_requests = @doorbot.access_requests
      .order(:created_at).reverse_order.limit(10)
    respond_with(@doorbot)
  end

  def new
    @doorbot = Doorbot.new
    authorize @doorbot
    respond_with(@doorbot)
  end

  def edit
    authorize @doorbot
  end

  def create
    @doorbot = Doorbot.new(doorbot_params)
    authorize @doorbot
    @doorbot.save
    respond_with(@doorbot)
  end

  def update
    authorize @doorbot
    @doorbot.update(doorbot_params)
    respond_with(@doorbot)
  end

  def destroy
    authorize @doorbot
    @doorbot.destroy
    respond_with(@doorbot)
  end

  private
    def set_doorbot
      @doorbot = Doorbot.find(params[:id])
    end

    def doorbot_params
      params.require(:doorbot).permit(
        *policy(@doorbot || Doorbot).permitted_attributes
      )
    end
end
