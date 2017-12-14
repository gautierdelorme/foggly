class DataReportRequestsController < ApplicationController
  before_action :set_data_report

  def index
    @data_requests = DataRequest.order(id: :desc).includes(data_endpoint: :data_source)
  end

  private

  def set_data_report
    @data_report = DataReport.find params[:data_report_id]
  end
end
