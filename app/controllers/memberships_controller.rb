class MembershipsController < ApplicationController
  before_action :set_user_group, only: %i[index create destroy]

  def index
    authorize @user_group, :show?
    @users = @user_group.users
    @membership = @user_group.memberships.find_by(user_id: current_user.id)
  end

  def create
    @membership = @user_group.memberships.new user_id: current_user.id
    if @membership.save
      redirect_back fallback_location: @user_group, notice: 'Group was successfully joined.'
    else
      redirect_back fallback_location: @user_group, flash: { error: 'Group was not joined.' }
    end
  end

  def destroy
    Membership.find(params[:id]).destroy
    redirect_back fallback_location: @user_group, notice: 'Group was successfully left.'
  end

  private

  def set_user_group
    @user_group = UserGroup.find params[:user_group_id]
  end
end
