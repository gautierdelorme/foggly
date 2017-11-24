class MembershipsController < ApplicationController
  before_action :set_user_group, only: %i[create destroy]

  def create
    @membership = @user_group.memberships.new user_id: current_user.id
    if @membership.save
      redirect_to @user_group, notice: 'Group was successfully joined.'
    else
      redirect_to @user_group, flash: { error: 'Group was not joined.' }
    end
  end

  def destroy
    Membership.find(params[:id]).destroy
    redirect_to @user_group, notice: 'Group was successfully left.'
  end

  private

  def set_user_group
    @user_group = UserGroup.find params[:user_group_id]
  end
end
