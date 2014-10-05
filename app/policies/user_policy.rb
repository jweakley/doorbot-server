class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def create?
    user.admin?
  end

  def update?
    user == record
  end

  def permitted_attributes
    [:email, :password, :password_confirmation, :current_password]
  end

  class Scope < Struct.new(:current_user, :scope)
    def resolve
      if true
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end
end
