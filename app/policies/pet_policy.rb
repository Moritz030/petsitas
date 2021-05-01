class PetPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where(species: params(:species))
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def edit?
    belongs_to_user_or_admin?
  end

  def destroy?
    belongs_to_user_or_admin?
  end
end
