class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id, image_names: []) # image_namesを配列として許可
  end
end