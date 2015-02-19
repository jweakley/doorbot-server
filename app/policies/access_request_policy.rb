class AccessRequestPolicy < ApplicationPolicy
  def index?
    user.admin?
  end
end
