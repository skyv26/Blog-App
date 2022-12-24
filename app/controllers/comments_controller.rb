class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(post_id: params[:id], author: current_user, text: params[:text])
    redirect_to post_id_path(current_user.id, params[:id]) if @comment.save
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    redirect_to post_id_path(params[:user_id], params[:id])
  end
end
