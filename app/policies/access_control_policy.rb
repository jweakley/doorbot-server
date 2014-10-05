class AccessControlPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def permitted_attributes
    [:doorbot_id, :credential_id]
  end
end
