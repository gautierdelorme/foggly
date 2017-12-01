class DataEndpointsController < ApplicationController
  before_action :set_data_source
  before_action :set_data_endpoint, only: %i[show edit update destroy]

  def index
    authorize @data_source, :show?
    @data_endpoints = @data_source.data_endpoints.by_name
  end

  def show
    authorize @data_source
  end

  def new
    authorize @data_source, :update?
    @data_endpoint = @data_source.data_endpoints.new
  end

  def edit
    authorize @data_source
  end

  def create
    authorize @data_source, :update?
    @data_endpoint = @data_source.data_endpoints.new(data_endpoint_params)

    if @data_endpoint.save
      redirect_to data_source_data_endpoint_url(@data_source, @data_endpoint), notice: 'Data endpoint was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @data_source
    if @data_endpoint.update(data_endpoint_params)
      redirect_back(
        fallback_location: edit_data_source_data_endpoint_url(@data_source, @data_endpoint),
        notice: 'Data endpoint was successfully updated.'
      )
    else
      render :edit
    end
  end

  def destroy
    authorize @data_source, :update?
    @data_endpoint.destroy
    redirect_to data_source_data_endpoints_url(@data_source), notice: 'Data endpoint was successfully destroyed.'
  end

  private

  def set_data_source
    @data_source = DataSource.find params[:data_source_id]
  end

  def set_data_endpoint
    @data_endpoint = DataEndpoint.find params[:id]
  end

  def data_endpoint_params
    params.require(:data_endpoint).permit(:name, :description, :method, :path).merge(user_id: current_user.id)
  end
end
