class PostsController < ApplicationController
  def index
    @user = User.find(request.parameters[:user_id])
  end

  def show
    @post = Post.find(request.parameters[:id])
  end
end
