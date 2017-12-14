class DataReportsController < ApplicationController
  before_action :set_data_report, only: %i[show edit update destroy]

  def index
    @data_reports = policy_scope(DataReport).by_name.includes(:user)
  end

  def show
    authorize @data_report
  end

  def new
    @data_report = DataReport.new
  end

  def edit
    authorize @data_report
  end

  def create
    @data_report = DataReport.new(data_report_params)

    if @data_report.save
      redirect_to @data_report, notice: 'Data report was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @data_report
    if @data_report.update(data_report_params)
      redirect_back fallback_location: edit_data_report_url(@data_report), notice: 'Data report was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @data_report
    @data_report.destroy
    redirect_to data_reports_url, notice: 'Data report was successfully destroyed.'
  end

  private

  def set_data_report
    @data_report = DataReport.find params[:id]
  end

  def data_report_params
    params.require(:data_report).permit(:name, :body).merge(user_id: current_user.id)
  end
end
