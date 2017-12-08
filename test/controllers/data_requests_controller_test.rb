require 'test_helper'

class DataRequestsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:alice)
    @data_request = data_requests(:one)
    @data_endpoint = @data_request.data_endpoint
    @data_source = @data_endpoint.data_source
  end

  test 'should get index' do
    get url_for([@data_source, @data_endpoint, :data_requests])
    assert_response :success
  end

  test 'should get new' do
    get url_for([:new, @data_source, @data_endpoint, :data_request])
    assert_response :success
  end

  test 'should create data_request' do
    assert_difference('DataRequest.count') do
      post url_for([@data_source, @data_endpoint, :data_requests]), params: {
        data_request: {
          params: @data_request.params, response: @data_request.response, url: @data_request.url
        }
      }
    end

    assert_redirected_to url_for([@data_source, @data_endpoint, DataRequest.last])
  end

  test 'should show data_request' do
    get url_for([@data_source, @data_endpoint, @data_request])
    assert_response :success
  end
end
