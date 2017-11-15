class FoodTourPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where.not(latitude: nil, longitude: nil)
    end
  end
   def index?
    true
  end
  def update?
    record.user == user
  end

   def create?
    return true
  end

  def destroy?
    record.user == user
  end
end
