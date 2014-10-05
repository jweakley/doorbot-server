module Api
  # rubocop:disable ClassLength
  class ApiBaseController < ActionController::Base
    include ActionController::HttpAuthentication::Token
    protect_from_forgery with: :null_session
    respond_to :json
    layout 'api'

    before_action :ensure_json, except: :not_found
    before_action :authenticate, except: :not_found

    rescue_from ActionController::RoutingError do
      not_found
    end

    rescue_from ActionController::ParameterMissing do |parameter_exception|
      parameter_missing(parameter_exception.param)
    end

    rescue_from ActiveRecord::RecordNotFound do
      resource_not_found
    end

    # Public: Requires API header token.
    def authenticate
      authenticate_or_request_with_http_token do |token, _options|
        Doorbot.exists?(api_key: token)
      end
    end

    def current_user
      @current_user ||= Doorbot.find_by(api_key: current_api_token)
      @current_user
    end

    def current_api_token
      @current_api_token ||= token_and_options(request)
    end

    # Public: Standard not found response.
    def not_found
      render status: :not_found, json: {
        errors: [I18n.t('api.errors.not_found')]
      }
    end

    # Public: Standard resource not found response.
    def resource_not_found
      render status: :not_found, json: {
        errors: [I18n.t('api.errors.resource_not_found')]
      }
    end

    # Public: Standard parameter missing response.
    def parameter_missing(parameter)
      render status: :unprocessable_entity, json: {
        errors: [
          I18n.t('api.errors.parameter_missing', parameter: parameter)
        ]
      }
    end

    def total_count(count)
      @total_count ||= count
    end

    def total_pages(pages)
      @total_pages ||= pages
    end

    def api_resource_errors(errors)
      @api_resource_errors ||= errors
    end

    protected

    # Overrides default responder
    def responder
      ApiResponder
    end

    # _before_filter_
    #
    # Protected: Ensures only json requests are hitting the API.
    def ensure_json
      if request.format != :json
        render status: :bad_request, json: {
          errors: [I18n.t('api.errors.only_json_or_xml')]
        }
        return false
      end
    end

    # Protected: Decodes pagination info. This is only loaded by
    # controllers actions that need it.
    def load_pagination
      @page = (params[:page].blank? ? 1 : params[:page].to_i)
      @per_page = (params[:per_page].blank? ? 10 : params[:per_page].to_i)
      if @page < 0
        render status: :bad_request, json: {
          errors: [I18n.t('api.errors.negative_page')]
        }
        return false
      end
    end

    def deprecation_warning
      # Not sure what the best choice is for this one. Perhaps a header? If so
      # we should add one to the error as well.
    end

    def deprecation_error
      render status: :gone, json: {
        errors: [I18n.t('api.errors.deprecation_error')]
      }
    end

    # Override to get the correct formatiing of response for Token Errors.
    def request_http_token_authentication(realm = 'Application')
      headers['WWW-Authenticate'] = %(Token realm="#{realm.gsub(/"/, '')}")
      render status: :unauthorized, json: {
        errors: [I18n.t('api.errors.token_denied')]
      }
    end

    def parse_checkin
      if params[:checkin].blank?
        render_error_with_message(I18n.t('api.lodgings.checkin_blank'))
      else
        @checkin = Date.strptime(params[:checkin], '%Y%m%d')
      end
    rescue ArgumentError
      render_error_with_message(I18n.t('api.lodgings.invalid_checkin'))
    end

    def parse_nights
      if params[:nights].blank?
        render_error_with_message(I18n.t('api.lodgings.nights_blank'))
      else
        @nights = params[:nights].to_i
      end
    end

    def render_error_with_message(message)
      render status: :bad_request, json: { errors: [message] }
    end
  end
end
# rubocop:enable ClassLength
