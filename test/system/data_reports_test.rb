require 'application_system_test_case'

class DataReportsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @data_report = data_reports(:one)
    sign_in users(:alice)
  end

  test 'visiting the index page' do
    visit data_reports_url
    assert_selector 'h1', text: 'Reports'
    assert_selector 'table'
  end

  test 'visiting a data report page' do
    visit data_report_url @data_report
    assert_selector 'h1', text: @data_report.name.titleize
  end

  test 'visiting a data report edit page' do
    visit edit_data_report_url @data_report
    assert_selector 'form'
  end
end
