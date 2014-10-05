# Moduel to apply correct status codes for responses.
module PaginationResponder
  def respond(*)
    if paginated?
      controller.total_count(resource.total_count)
      controller.total_pages(resource.total_pages)
    end
    super
  end

  private

  def paginated?
    resource.respond_to?(:total_count) &&
    resource.respond_to?(:total_pages)
  end
end
