class AccessControlsController < ApplicationController
  respond_to :html
  before_action :set_access_control, only: [:show, :edit, :update, :destroy]
  before_action :set_relations, only: [:new, :create, :edit, :update]

  def index
    @access_controls = AccessControl.all
    authorize @access_controls
    respond_with(@access_controls)
  end

  def show
    authorize @access_control
    respond_with(@access_control)
  end

  def new
    @access_control = AccessControl.new
    authorize @access_control
    respond_with(@access_control)
  end

  def edit
    authorize @access_control
  end

  def create
    @access_control = AccessControl.new(access_control_params)
    authorize @access_control
    @access_control.save
    respond_with(@access_control)
  end

  def update
    authorize @access_control
    @access_control.update(access_control_params)
    respond_with(@access_control)
  end

  def destroy
    authorize @access_control
    @access_control.destroy
    respond_with(@access_control)
  end

  private
    def set_access_control
      @access_control = AccessControl.find(params[:id])
    end

    def access_control_params
      params.require(:access_control).permit(
        *policy(@access_control || AccessControl).permitted_attributes
      )
    end

    def set_relations
      @doorbots = Doorbot.all
      @credentials = Credential.all
    end
end
