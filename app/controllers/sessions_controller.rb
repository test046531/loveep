class SessionsController < ApplicationController
  def new
  end

  def create
    user =  User.find_by(emial: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      reset_session
      log_in user
      redirect_to
    else
      flash.now[:danger] = 'メールアドレスとパスワードの組み合わせが一致しません'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
  end

end
