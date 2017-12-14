require 'test_helper'

class DataRequestReportsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:alice)
    @data_report = data_reports(:one)
    @data_request = data_requests(:one)
    @data_endpoint = @data_request.data_endpoint
    @data_source = @data_endpoint.data_source
  end

  test 'should get index' do
    get url_for([@data_source, @data_endpoint, @data_request, :data_request_reports])
    assert_response :success
  end

  test 'should update data report' do
    initial_data_report = @data_report.dup
    put data_source_data_endpoint_data_request_data_request_report_path(@data_source, @data_endpoint, @data_request, @data_report)
    assert_equal @data_report.reload.body, DataRequestReportsController.render(
      :update,
      layout: false,
      formats: :text,
      assigns: { data_report: initial_data_report, data_request: @data_request }
    )
    assert_redirected_to @data_report
  end
end
