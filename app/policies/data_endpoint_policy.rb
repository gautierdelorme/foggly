class DataEndpointPolicy < ApplicationPolicy
  delegate :show?, to: :data_source_policy

  def data_source_policy
    @data_source_policy ||= DataSourcePolicy.new user, record.data_source
  end

  def update?
    user.admin? || record.user == user
  end

  def destroy?
    user.admin? || record.user == user
  end
end
