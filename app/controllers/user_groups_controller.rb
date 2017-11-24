class UserGroupsController < ApplicationController
  before_action :set_user_group, only: %i[show edit update]

  def index
    @user_groups = UserGroup.all
  end

  def show
    @membership = @user_group.memberships.find_by(user_id: current_user.id)
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

  def update
    if @user_group.update(user_group_params)
      redirect_to @user_group, notice: 'User group was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user_group
    @user_group = UserGroup.find(params[:id])
  end

  def user_group_params
    params.require(:user_group).permit(:name, :description)
  end
end
