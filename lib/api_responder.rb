# This responder handles API repsonses.
class ApiResponder < ActionController::Responder
  include StatusResponder
  include PaginationResponder
end
