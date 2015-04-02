class AccessRequestsController < ApplicationController
  respond_to :html
  before_action :set_access_request, only: [:show, :edit, :update, :destroy]

  def index
    @access_requests = AccessRequest.order(:created_at).reverse_order.page(params[:page])
    authorize @access_requests
    respond_with(@access_requests)
  end

  private
    def set_access_request
      @access_request = AccessRequest.find(params[:id])
    end

    def access_request_params
      params.require(:access_request).permit(
        *policy(@access_request || AccessRequest).permitted_attributes
      )
    end
end
