class UsersController < ApplicationController
    def index
      @users = User.all
    end
  
    def new
    end
  
    def create
      @user = User.new(user_params)
  
      if @user.save
        flash[:success] = "ユーザーを作成しました"
        redirect_to posts_path
      else
        flash[:success] = "ユーザーを作成できませんでした"
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end