require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:bob)
    sign_in users(:alice)
  end

  test 'visiting the index page' do
    visit users_url
    assert_selector 'h1', text: 'User'
    assert_selector 'table'
  end

  test 'visiting a user page' do
    visit user_url @user
    assert_selector 'h1', text: @user.name.titleize
  end
end
