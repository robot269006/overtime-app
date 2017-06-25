class PostsController < ApplicationController

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:date, :rationale))
    @post.save
  end

end
