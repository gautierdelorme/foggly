require 'test_helper'

class UserGroupsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user_group = user_groups(:one)
    @current_user = users(:alice)
    sign_in @current_user
  end

  test 'should get index' do
    get user_groups_url
    assert_response :success
  end

  test 'should get new' do
    get new_user_group_url
    assert_response :success
  end

  test 'should create user_group' do
    assert_difference('UserGroup.count') do
      post user_groups_url, params: { user_group: { description: @user_group.description, name: @user_group.name } }
    end

    assert_includes UserGroup.last.users, @current_user
    assert_redirected_to user_group_url(UserGroup.last)
  end

  test 'should show user_group' do
    get user_group_url(@user_group)
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_group_url(@user_group)
    assert_response :success
  end

  test 'should update user_group' do
    patch user_group_url(@user_group), params: { user_group: { description: @user_group.description, name: @user_group.name } }
    assert_redirected_to user_group_url(@user_group)
  end
end
