class UsersController < ApplicationController
  def index
    @all_users = User.all
  end

  def show
    @user = User.find(request.parameters[:id].to_i)
    puts @user
  end
end
