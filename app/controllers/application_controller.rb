class ApplicationController < ActionController::Base
  include SessionsHelper

  # ログイン済みユーザーかどうかを確認
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください"
      redirect_to login_url, status: :see_other
    end
  end
  
  # 正しいユーザーかどうかを確認
  def correct_user
    @user ||= User.find(params[:id])
    redirect_to(root_url, status: :see_other) unless current_user?(@user)
  end
end
