# Moduel to apply correct status codes for responses.
module StatusResponder
  def respond(*)
    status = options.delete(:status)
    if status.blank?
      set_status_code
    else
      controller.response.status = status
    end
    super
  end

  def json_resource_errors
    { data: { errors: resource.errors } }
  end

  private

  def set_status_code
    case
    when has_errors?
      controller.response.status = :unprocessable_entity
    when get? && !resource
      controller.response.status = :not_found
    when post?
      controller.response.status = :created
    end
  end
end
