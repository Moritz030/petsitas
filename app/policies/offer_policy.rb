class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:requests).where("requests.status = 'open'").distinct
    end
  end

  def create?
    record.pet.user == user
  end

  def new?
    true
  end
  # def edit?
  #   belongs_to_user_or_admin?
  # end

  # def destroy?
  #   belongs_to_user_or_admin?
  # end
end
