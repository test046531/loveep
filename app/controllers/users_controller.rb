class PostsController < ApplicationController
    def index
      @users = User.all
    end
  
    def new
    end
  
    def create
      @user = User.new(user_params)
  
      if @post.save
        redirect_to posts_path
      else
        render :new
      end
    end
  
    private
  
    def user_params
      params.require(:post).permit(:name, :email, :password)
    end
  end