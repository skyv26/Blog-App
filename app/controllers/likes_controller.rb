class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(post_id: params[:id], author: current_user)
    @like.save
    redirect_to post_id_path(current_user.id, params[:id])
  end
end
