require 'application_system_test_case'

class DataRequestsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:alice)
    @data_request = data_requests(:one)
    @data_endpoint = @data_request.data_endpoint
    @data_source = @data_endpoint.data_source
  end

  test 'visiting the index page' do
    visit url_for [@data_source, @data_endpoint, :data_requests]
    assert_selector 'h1', text: @data_source.name.titleize
    assert_selector 'table'
  end

  test 'visiting a data request page' do
    visit url_for [@data_source, @data_endpoint, @data_request]
    assert_selector 'span', text: @data_request.url
  end
end
