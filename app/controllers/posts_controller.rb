class PostsController < ApplicationController
  before_action :logged_in_user
  before_action :current_user
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = @current_user.posts.build
  end

  def create
    @post = @current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "新規投稿に成功しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to edit_post_path(@post), notice: "投稿が編集されました"
    else
      render :edit, status: :unprocessable_entity
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿が削除されました" # userページができ次第変更します
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id, :image_name)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def correct_user
    @user = @post.user
    redirect_to root_url unless current_user = @user
  end
end