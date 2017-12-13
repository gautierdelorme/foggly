require 'test_helper'

class DataEndpointPolicyTest < ActiveSupport::TestCase
  setup do
    @user = users(:alice)
    @admin = users(:admin)
  end

  test 'can update owned data endpoints' do
    assert_permit @user, data_endpoints(:one), :update?
  end

  test 'cannot update not owned user endpoints' do
    refute_permit @user, data_endpoints(:two), :update?
  end

  test 'can destroy owned data endpoints' do
    assert_permit @user, data_endpoints(:one), :destroy?
  end

  test 'cannot destroy not owned data endpoints' do
    refute_permit @user, data_endpoints(:two), :destroy?
  end

  test 'can access not restricted data endpoints' do
    assert_permit @user, data_endpoints(:one), :show?
  end

  test 'cannot access restricted data endpoints' do
    refute_permit @user, data_endpoints(:three), :show?
  end

  test 'admin can access restricted data endpoints' do
    assert_permit @admin, data_endpoints(:three), :show?
  end

  test 'admin can edit restricted data sources' do
    assert_permit @admin, data_endpoints(:three), :update?
  end

  test 'admin can destroy restricted data sources' do
    assert_permit @admin, data_endpoints(:three), :destroy?
  end
end
