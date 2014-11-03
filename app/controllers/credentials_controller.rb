class CredentialsController < ApplicationController
  respond_to :html
  before_action :set_credential, only: [:show, :edit, :update, :destroy]

  def index
    @credentials = Credential.all
    authorize @credentials
    respond_with(@credentials)
  end

  def show
    authorize @credential
    respond_with(@credential)
  end

  def new
    @credential = Credential.new
    authorize @credential
    respond_with(@credential)
  end

  def edit
    authorize @credential
  end

  def create
    @credential = Credential.new(credential_params)
    authorize @credential
    @credential.save
    respond_with(@credential)
  end

  def update
    authorize @credential
    @credential.update(credential_params)
    respond_with(@credential)
  end

  def destroy
    authorize @credential
    @credential.destroy
    respond_with(@credential)
  end

  private
    def set_credential
      @credential = Credential.find(params[:id])
    end

    def credential_params
      params.require(:credential).permit(:type, :nickname, :key)
    end
end
