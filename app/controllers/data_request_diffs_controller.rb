class DataRequestDiffsController < ApplicationController
  before_action :set_data_request
  before_action :set_data_request_compared, only: :show

  def index
    authorize @data_source, :show?
    @data_requests = @data_endpoint.data_requests.where.not(id: @data_request.id).order id: :desc
  end

  def show
    authorize @data_source
  end

  private

  def set_data_request
    @data_source = DataSource.find params[:data_source_id]
    @data_endpoint = DataEndpoint.find params[:data_endpoint_id]
    @data_request = DataRequest.find params[:data_request_id]
  end

  def set_data_request_compared
    @data_request_compared = DataRequest.find params[:id]
  end
end
