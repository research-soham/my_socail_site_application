class PostsController < ApplicationController
  before_action :check_account
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    @accounts = Account.all
    @like = Like.new
  end

  def show
    @accounts = Account.all
    @profiles = Profile.all
    @comment = Comment.new
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def update
    if @post.update
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity  
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:account_id, :description, :hashtag_ids, :location, :images)
  end
end
