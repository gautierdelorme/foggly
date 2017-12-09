require 'test_helper'

class DataRequestTest < ActiveSupport::TestCase
  setup do
    @data_request = data_requests(:one)
  end

  test 'valid' do
    assert @data_request.valid?
  end

  test 'invalid without user' do
    refute DataRequest.new(data_endpoint: data_endpoints(:one), url: 'test').valid?
  end

  test 'invalid without data endpoint' do
    refute DataRequest.new(user: users(:alice), url: 'test').valid?
  end

  test 'invalid without URL' do
    refute DataRequest.new(user: users(:alice), data_endpoint: data_endpoints(:one)).valid?
  end

  test '#exec!' do
    assert_changes -> { @data_request.response } do
      @data_request.exec!
    end
  end
end
