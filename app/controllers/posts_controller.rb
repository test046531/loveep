class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  # Sessionの作成後にコメントアウトを外します
  # before_action :logged_in_user
  # before_action :correct_user, only: [:new, :create, :edit, :update, :destory]

  def index
    @posts = @user.posts
  end

  def new
    @post = @user.posts.build
  end

  def create
    @post = @user.posts.build(post_params)
    if @post.save
      redirect_to user_posts_path(@user), notice: "新規投稿に成功しました"
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
      redirect_to user_post_path(@user, @post), notice: "投稿が編集されました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path(@user), notice: "投稿が削除されました"
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :user_id, :image_name)
  end

end
