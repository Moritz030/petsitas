class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    true
  end

  def create?
    true
  end

  def edit?
    belongs_to_user_or_admin?
  end

  def destroy?
    belongs_to_user_or_admin?
  end
end
