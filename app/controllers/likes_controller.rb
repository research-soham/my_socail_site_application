class LikesController < ApplicationController

  def show
    @post = Post.find_by(id: params[:id])
    @likes = @post.likes
    @accounts = Account.where(id: @likes.map{|i| i.account_id })
  end

  def create
    @like = Like.new(like_params)
    @like.save
    redirect_to request.referrer
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @like.destroy
    redirect_to request.referrer
  end

  private
  def like_params
    params.require(:like).permit(:account_id, :likeable_type, :likeable_id)
  end
end
