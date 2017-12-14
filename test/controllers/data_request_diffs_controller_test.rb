require 'test_helper'

class DataRequestDiffsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:alice)
    @data_request = data_requests(:one)
    @data_request_compared = data_requests(:four)
    @data_endpoint = @data_request.data_endpoint
    @data_source = @data_endpoint.data_source
  end

  test 'should get index' do
    get url_for [@data_source, @data_endpoint, @data_request, :data_request_diffs]
    assert_response :success
  end

  test 'should show data request diff' do
    get data_source_data_endpoint_data_request_data_request_diff_path(
      @data_source,
      @data_endpoint,
      @data_request,
      @data_request_compared
    )
    assert_response :success
  end
end
