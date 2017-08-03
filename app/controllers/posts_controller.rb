class PostsController < ApplicationController

  before_action :set_params, only: [:show, :edit, :update, :destroy, :approve]

  def index
    @posts = Post.posts_by(current_user).page(params[:page]).per(10)
  end

  def approve
    @post.approved!
    redirect_to root_path, notice: "The post has been approved"
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post, notice: "Your post has been saved"
    else
      render :new
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: "Your post has been edited"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @post.delete
    redirect_to posts_path, notice: "Your post was deleted"
  end

  private
    def post_params
      params.require(:post).permit(:date, :rationale, :status, :overtime_request)
    end

    def set_params
      @post = Post.find(params[:id])
    end

end
