class CommentsController < ApplicationController
  before_action :check_account
  before_action :set_post, only: [:show]

  def index
    @comments = @post.comments
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post_id)
    else
      redirect_to post_path(@comment.post_id)
    end
  end

  private
  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:data, :account_id, :post_id)
  end
end
