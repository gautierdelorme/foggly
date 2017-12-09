class DataRequestsController < ApplicationController
  before_action :set_data_endpoint
  before_action :set_data_request, only: :show

  def index
    authorize @data_source, :show?
    @data_requests = @data_endpoint.data_requests.order id: :desc
  end

  def show
    authorize @data_source
  end

  def new
    authorize @data_source, :show?
    @data_request = @data_endpoint.data_requests.new
  end

  def create
    authorize @data_source, :show?
    @data_request = @data_endpoint.data_requests.new(data_request_params)

    if @data_request.save
      @data_request.exec!
      redirect_to [@data_source, @data_endpoint, @data_request], notice: 'Data request was successfully created.'
    else
      render :new
    end
  end

  private

  def set_data_endpoint
    @data_source = DataSource.find params[:data_source_id]
    @data_endpoint = DataEndpoint.find params[:data_endpoint_id]
  end

  def set_data_request
    @data_request = DataRequest.find params[:id]
  end

  def data_request_params
    params.require(:data_request).permit(:url, :params, :response).merge(user_id: current_user.id).tap do |params|
      params[:params] = JSON.parse(params[:params].presence || '{}')
    end
  end
end
