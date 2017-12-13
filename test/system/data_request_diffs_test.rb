require 'application_system_test_case'

class DataRequestDiffsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:alice)
    @data_request = data_requests(:one)
    @data_request_compared = data_requests(:four)
    @data_endpoint = @data_request.data_endpoint
    @data_source = @data_endpoint.data_source
  end

  test 'visiting the index page' do
    visit url_for [@data_source, @data_endpoint, @data_request, :data_request_diffs]
    assert_selector 'h1', text: @data_source.name.titleize
    assert_selector 'h1', text: @data_endpoint.name.titleize
    assert_selector 'table'
  end

  test 'visiting a data request diff page' do
    visit data_source_data_endpoint_data_request_data_request_diff_path(
      @data_source,
      @data_endpoint,
      @data_request,
      @data_request_compared
    )
    assert_selector 'h4', text: "Diff between ##{@data_request.id} and ##{@data_request_compared.id}"
    assert_selector 'code'
  end
end
