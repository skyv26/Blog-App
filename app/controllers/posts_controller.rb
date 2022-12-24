class PostsController < ApplicationController
  def index
    @user = User.find(request.parameters[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(author: current_user, title: params[:title], text: params[:text])
    if @post.save
      redirect_to start_path
    else
      puts @post.errors.full_messages
    end
  end

  def show
    @post = Post.find(request.parameters[:id])
    @user = User.find(params[:user_id])
  end

  def destroy
    @post = Post.find(request.parameters[:id])
    @post.destroy
    redirect_to all_post_path(params[:user_id])
  end
end
