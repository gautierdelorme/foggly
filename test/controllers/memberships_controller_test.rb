require 'test_helper'

class MembershipsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:alice)

    @membership = memberships(:one)
    @user_group = @membership.user_group
  end

  test 'should create membership' do
    assert_difference('Membership.count') do
      post user_group_memberships_path(@user_group)
    end

    assert_redirected_to user_group_url(Membership.last.user_group)
  end

  test 'should destroy membership' do
    assert_difference('Membership.count', -1) do
      delete user_group_membership_url(@user_group, @membership)
    end

    assert_redirected_to user_groups_url
  end
end
