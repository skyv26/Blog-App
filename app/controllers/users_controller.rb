class UsersController < ApplicationController
  def index
    @all_users = User.all
  end

  def show
    @id = request.parameters[:id]
    @user = User.find(@id)
  end
end
