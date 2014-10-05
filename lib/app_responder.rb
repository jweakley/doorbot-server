# Custom application responder.
class AppResponder < ActionController::Responder
  include Responders::FlashResponder
  def to_html
    if !get? && has_errors?
      if options.delete(:error_behavior) == :list || resource.errors.size == 1
        controller.flash.now[:alert] = resource.errors.full_messages.first
      else
        controller.flash.now[:alert] = 'Multiple errors were found.'
      end
    end
    super
  end
end
