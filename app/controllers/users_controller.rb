class UsersController < ApplicationController
  respond_to :html

  before_action :set_user

  def edit
    authorize @user
  end

  def update
    authorize @user
    @user.update_with_password(user_params)
    respond_with(@user, location: edit_user_url(@user))
  end

  private

  def set_user
    @user = policy_scope(User).find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      *policy(@user || User).permitted_attributes
    )
  end
end
