require 'test_helper'

class DataReportsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:alice)
    @data_report = data_reports(:one)
  end

  test 'should get index' do
    get data_reports_url
    assert_response :success
  end

  test 'should get new' do
    get new_data_report_url
    assert_response :success
  end

  test 'should create data_report' do
    assert_difference('DataReport.count') do
      post data_reports_url, params: { data_report: { body: @data_report.body, name: @data_report.name } }
    end

    assert_redirected_to data_report_url(DataReport.last)
  end

  test 'should show data_report' do
    get data_report_url(@data_report)
    assert_response :success
  end

  test 'should get edit' do
    get edit_data_report_url(@data_report)
    assert_response :success
  end

  test 'should update data_report' do
    patch data_report_url(@data_report), params: { data_report: { body: @data_report.body, name: @data_report.name } }
    assert_redirected_to edit_data_report_url(@data_report)
  end

  test 'should destroy data_report' do
    assert_difference('DataReport.count', -1) do
      delete data_report_url(@data_report)
    end

    assert_redirected_to data_reports_url
  end
end
