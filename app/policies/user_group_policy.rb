class UserGroupPolicy < ApplicationPolicy
  def update?
    user.admin? || record.user == user
  end

  def destroy?
    user.admin? || record.user == user
  end

  class Scope < Scope
    def resolve
      return scope if user.admin?
      scope.accessible_by user
    end
  end
end
