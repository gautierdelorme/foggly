class DataSourcePolicy < ApplicationPolicy
  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.accessible_by user
    end
  end
end
