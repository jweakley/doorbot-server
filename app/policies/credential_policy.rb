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
    [:nickname, :key]
  end
end
