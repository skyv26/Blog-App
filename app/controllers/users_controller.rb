class UsersController < ApplicationController
  def index
    @all_users = User.all
  end

  def show
    @user = User.find(request.parameters[:id].to_i)
    @posts = Post.where(author: @user)
  end
end
