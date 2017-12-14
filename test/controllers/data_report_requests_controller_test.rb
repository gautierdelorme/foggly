require 'test_helper'

class DataReportRequestsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:alice)
    @data_report = data_reports(:one)
  end

  test 'should get index' do
    get url_for([@data_report, :data_report_requests])
    assert_response :success
  end
end
