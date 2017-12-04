class UserGroupsController < ApplicationController
  before_action :set_user_group, only: %i[show edit update destroy]

  def index
    @user_groups = policy_scope(UserGroup).by_name
  end

  def show
    authorize @user_group
  end

  def new
    @user_group = UserGroup.new
  end

  def create
    @user_group = UserGroup.new(user_group_params).tap do |user_group|
      user_group.users << current_user
    end
    if @user_group.save
      redirect_to @user_group, notice: 'User group was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @user_group
  end

  def update
    authorize @user_group
    if @user_group.update(user_group_params)
      redirect_back fallback_location: edit_user_group_url(@user_group), notice: 'User group was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @user_group
    @user_group.destroy
    redirect_to user_groups_url, notice: 'User group was successfully destroyed.'
  end

  private

  def set_user_group
    @user_group = UserGroup.find(params[:id])
    @membership = @user_group.memberships.find_by(user_id: current_user.id)
  end

  def user_group_params
    params.require(:user_group).permit(:name, :description, :visibility, user_ids: []).merge(user_id: current_user.id)
  end
end
