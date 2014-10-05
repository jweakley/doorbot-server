# A top-level policy for setting defaults.
class ApplicationPolicy
  attr_reader :user, # User performing the action
              :record # Instance upon which action is performed

  def initialize(user, record)
    fail Pundit::NotAuthorizedError, 'Must be signed in.' unless user
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, # User performing the action
                :scope # Instance upon which scope is performed

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
