require "app_responder"
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Overrides default responder
  self.responder = AppResponder

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    if user_signed_in?
      flash[:error] = I18n.t "pundit.#{policy_name}.#{exception.query}",
        default: (I18n.t 'pundit.default')
      redirect_to(request.referrer || root_url)
    else
      flash[:error] = I18n.t 'pundit.login_required'
      redirect_to root_url
    end
  end
end
