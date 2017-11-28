class UsersController < ApplicationController
  def index
    @users = User.by_name
  end

  def show
    @user = User.find(params[:id])
  end
end
