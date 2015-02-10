class CredentialPolicy < ApplicationPolicy
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
    [:nickname, :key, access_controls_attributes: [:doorbot_id]]
  end
end
