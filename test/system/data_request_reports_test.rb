require 'application_system_test_case'

class DataRequestReportsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:alice)
    @data_request = data_requests(:one)
    @data_report = data_reports(:one)
    @data_endpoint = @data_request.data_endpoint
    @data_source = @data_endpoint.data_source
  end

  test 'visiting the index page' do
    visit url_for [@data_source, @data_endpoint, @data_request, :data_request_reports]
    assert_selector 'h1', text: @data_source.name.titleize
    assert_selector 'h1', text: @data_endpoint.name.titleize
    assert_selector 'table'
  end
end
