class PostsController < ApplicationController
  def index
    @user_id = request.parameters[:user_id]
  end
end