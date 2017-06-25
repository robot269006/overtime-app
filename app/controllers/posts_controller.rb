class PostsController < ApplicationController

  before_action :set_params, only: [:show]

  def index
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

  def show
  end

  private
    def post_params
      params.require(:post).permit(:date, :rationale)
    end

    def set_params
      @post = Post.find(params[:id])
    end

end
