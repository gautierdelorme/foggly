class DataRequestReportsController < ApplicationController
  before_action :set_data_request
  before_action :set_data_report, only: :update

  def index
    @data_reports = policy_scope(DataReport).by_name.includes(:user)
  end

  def update
    authorize @data_report
    if @data_report.update(body: render_to_string(layout: false, formats: :text))
      redirect_to @data_report, notice: 'Data report was successfully updated.'
    else
      redirect_back(
        fallback_location: url_for([@data_source, @data_endpoint, @data_request, :data_request_reports]),
        flash: { error: @data_report.errors.full_messages.to_sentence }
      )
    end
  end

  private

  def set_data_request
    @data_source = DataSource.find params[:data_source_id]
    @data_endpoint = DataEndpoint.find params[:data_endpoint_id]
    @data_request = DataRequest.find params[:data_request_id]
  end

  def set_data_report
    @data_report = DataReport.find params[:id]
  end
end
