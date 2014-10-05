module ApplicationHelper
  def paginated?
    !@page.blank? &&
    !@total_pages.blank? &&
    !@total_count.blank?
  end
end
