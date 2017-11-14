require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:alice)
  end

  test 'should get index' do
    get conversations_url
    assert_response :success
  end

  test 'should show conversation' do
    get conversation_url users(:bob)
    assert_response :success
  end
end
