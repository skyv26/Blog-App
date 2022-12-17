class UsersController < ApplicationController
  def index
    @all_users = User.all
    @user = current_user
  end

  def show
    @user = User.find(request.parameters[:id].to_i)
  end
end
