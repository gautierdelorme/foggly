class UsersController < ApplicationController
  def index
    @users = @q.result
  end

  def show
    @user = User.find(params[:id])
  end
end
