class PostsController < ApplicationController
  def index
    @user_id = request.parameters[:user_id]
  end

  def show
    @user_id = request.parameters[:user_id]
    @post_id = request.parameters[:id]
  end
end