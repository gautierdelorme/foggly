require 'test_helper'

class DataEndpointsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:alice)
    @data_endpoint = data_endpoints(:one)
    @data_source = @data_endpoint.data_source
  end

  test 'should get index' do
    get data_source_data_endpoints_url(@data_source)
    assert_response :success
  end

  test 'should get new' do
    get new_data_source_data_endpoint_url(@data_source)
    assert_response :success
  end

  test 'should create data_endpoint' do
    assert_difference('DataEndpoint.count') do
      post data_source_data_endpoints_url(@data_source), params: {
        data_endpoint: {
          description: @data_endpoint.description,
          method: @data_endpoint.method,
          name: @data_endpoint.name,
          path: @data_endpoint.path
        }
      }
    end

    assert_redirected_to data_source_data_endpoint_url(@data_source, DataEndpoint.last)
  end

  test 'should show data_endpoint' do
    get data_source_data_endpoint_url(@data_source, @data_endpoint)
    assert_response :success
  end

  test 'should get edit' do
    get edit_data_source_data_endpoint_url(@data_source, @data_endpoint)
    assert_response :success
  end

  test 'should update data_endpoint' do
    patch data_source_data_endpoint_url(@data_source, @data_endpoint), params: {
      data_endpoint: {
        description: @data_endpoint.description,
        method: @data_endpoint.method,
        name: @data_endpoint.name,
        path: @data_endpoint.path
      }
    }
    assert_redirected_to edit_data_source_data_endpoint_url(@data_source, @data_endpoint)
  end

  test 'should destroy data_endpoint' do
    assert_difference('DataEndpoint.count', -1) do
      delete data_source_data_endpoint_url(@data_source, @data_endpoint)
    end

    assert_redirected_to data_source_data_endpoints_url(@data_source)
  end
end
