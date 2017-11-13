require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'should get index when authenticated' do
    sign_in users(:alice)
    get root_url
    assert_response :success
  end

  test 'should get redirected when unauthenticated' do
    get root_url
    assert_redirected_to '/users/sign_in'
  end
end
