class DataSourcesController < ApplicationController
  before_action :set_data_source, only: %i[show edit update destroy]

  def index
    @data_sources = @q.result.by_name.includes(:user)
  end

  def show
    authorize @data_source
  end

  def new
    @data_source = DataSource.new
  end

  def edit
    authorize @data_source
    @user_groups = policy_scope(UserGroup).by_name
  end

  def create
    @data_source = DataSource.new(data_source_params)

    if @data_source.save
      redirect_to @data_source, notice: 'Data source was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @data_source
    if @data_source.update(data_source_params)
      redirect_back fallback_location: edit_data_source_url(@data_source), notice: 'Data source was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @data_source
    @data_source.destroy
    redirect_to data_sources_url, notice: 'Data source was successfully destroyed.'
  end

  private

  def set_data_source
    @data_source = DataSource.find(params[:id])
  end

  def data_source_params
    params.require(:data_source).permit(:name, :description, :base_url, user_group_ids: []).merge(user_id: current_user.id)
  end
end
