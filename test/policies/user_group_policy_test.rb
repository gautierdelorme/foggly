require 'test_helper'

class UserGroupPolicyTest < ActiveSupport::TestCase
  setup do
    @user = users(:alice)
  end

  test 'can update owned user groups' do
    assert_permit @user, user_groups(:one), :update?
  end

  test 'cannot update not owned user groups' do
    refute_permit @user, user_groups(:two), :update?
  end

  test 'can destroy owned user groups' do
    assert_permit @user, user_groups(:one), :destroy?
  end

  test 'cannot destroy not owned user groups' do
    refute_permit @user, user_groups(:two), :destroy?
  end

  test 'can access public user groups' do
    assert_permit @user, user_groups(:two), :show?
  end

  test 'cannot access private user groups' do
    refute_permit @user, user_groups(:three), :show?
  end

  test 'can access private user groups if member' do
    assert_permit @user, user_groups(:four), :show?
  end

  test 'can access private user groups if owned' do
    assert_permit @user, user_groups(:five), :show?
  end
end
