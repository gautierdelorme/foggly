require 'application_system_test_case'

class UserGroupsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @user_group = user_groups(:one)
    sign_in users(:alice)
  end

  test 'visiting the index page' do
    visit user_groups_url
    assert_selector 'h1', text: 'Groups'
    assert_selector 'table'
  end

  test 'visiting a user group page' do
    visit user_group_url @user_group
    assert_selector 'h1', text: @user_group.name
  end

  test 'visiting a user group edit page' do
    visit edit_user_group_url @user_group
    assert_selector 'h1', text: "Edit #{@user_group.name}"
    assert_selector 'form'
  end
end
