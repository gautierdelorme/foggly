require 'test_helper'

class DataRequestPolicyTest < ActiveSupport::TestCase
  setup do
    @user = users(:alice)
    @admin = users(:admin)
  end

  test 'can access not restricted data requests' do
    assert_permit @user, data_requests(:one), :show?
  end

  test 'cannot access restricted data endpoints' do
    refute_permit @user, data_requests(:three), :show?
  end

  test 'admin can access restricted data endpoints' do
    assert_permit @admin, data_requests(:three), :show?
  end
end
