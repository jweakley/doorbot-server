module Api
  module V1
    class CredentialsController < ApiBaseController
      def show
        @credential = current_user.credentials.find_by(
          form: params[:form],
          key: params[:id]
        )
        current_user.access_requests.create(
          form: params[:form],
          key: params[:id],
          access_granted: !@credential.blank?
        )
        if(@credential.blank?)
          render_error_with_message('Invalid Credentials')
        else
          respond_with(@credential)
        end
      end
    end
  end
end
