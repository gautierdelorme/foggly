class DataRequestPolicy < ApplicationPolicy
  delegate :show?, to: :data_source_policy

  def data_source_policy
    @data_source_policy ||= DataSourcePolicy.new user, record.data_source
  end
end
