require 'application_system_test_case'

class DataEndpointsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @data_endpoint = data_endpoints(:one)
    @data_source = @data_endpoint.data_source
    sign_in users(:alice)
  end

  test 'visiting the index page' do
    visit data_source_data_endpoints_url @data_source
    assert_selector 'h1', text: @data_source.name.titleize
    assert_selector 'table'
  end

  test 'visiting a data endpoint page' do
    visit data_source_data_endpoint_url @data_source, @data_endpoint
    assert_selector 'h1', text: @data_endpoint.name.titleize
  end

  test 'visiting a data endpoint edit page' do
    visit edit_data_source_data_endpoint_url @data_source, @data_endpoint
    assert_selector 'form'
  end
end
