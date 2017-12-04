require 'test_helper'

class DataSourcePolicyTest < ActiveSupport::TestCase
  setup do
    @user = users(:alice)
    @admin = users(:admin)
  end

  test 'can update owned data sources' do
    assert_permit @user, data_sources(:one), :update?
  end

  test 'cannot update not owned user groups' do
    refute_permit @user, data_sources(:two), :update?
  end

  test 'can destroy owned data sources' do
    assert_permit @user, data_sources(:one), :destroy?
  end

  test 'cannot destroy not owned user groups' do
    refute_permit @user, data_sources(:two), :destroy?
  end

  test 'can access not restricted data sources' do
    assert_permit @user, data_sources(:one), :show?
  end

  test 'cannot access restricted data sources' do
    refute_permit @user, data_sources(:three), :show?
  end

  test 'can access restricted data sources if member' do
    assert_permit @user, data_sources(:two), :show?
  end

  test 'can access restricted data sources if owned' do
    assert_permit @user, data_sources(:four), :show?
  end

  test 'admin can access restricted data sources' do
    assert_permit @admin, data_sources(:three), :show?
  end

  test 'admin can edit restricted data sources' do
    assert_permit @admin, data_sources(:three), :update?
  end

  test 'admin can destroy restricted data sources' do
    assert_permit @admin, data_sources(:three), :destroy?
  end
end
