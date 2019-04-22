class SessionsController < ApplicationController
  
  # 新規登録(GET)
  def new
  end
  
  # ログイン(POST)
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  # ログアウト(DELETE)
  def destroy
    log_out
    redirect_to root_url
  end
end