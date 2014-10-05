module Api
  module V1
    class CredentialsController < ApiBaseController
      def show
        @credential = current_user.credentials.find_by(
          form: params[:form],
          key: params[:id]
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
