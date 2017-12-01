require 'application_system_test_case'

class DataSourcesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @data_source = data_sources(:one)
    sign_in users(:alice)
  end

  test 'visiting the index page' do
    visit data_sources_url
    assert_selector 'h1', text: 'Data Sources'
    assert_selector 'table'
  end

  test 'visiting a data source page' do
    visit data_source_url @data_source
    assert_selector 'h1', text: @data_source.name.titleize
  end

  test 'visiting a data source edit page' do
    visit edit_data_source_url @data_source
    assert_selector 'form'
  end
end
