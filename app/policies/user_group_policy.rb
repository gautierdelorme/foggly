class UserGroupPolicy < ApplicationPolicy
  def update?
    record.user == user
  end
end
