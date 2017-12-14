require 'application_system_test_case'

class DataReportRequestsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:alice)
    @data_report = data_reports(:one)
  end

  test 'visiting the index page' do
    visit url_for [@data_report, :data_report_requests]
    assert_selector 'h1', text: @data_report.name.titleize
    assert_selector 'table'
  end
end
