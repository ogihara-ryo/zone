class SessionsController < ApplicationController
  def create
    session[:user_id] = authenticate_user(request.env['omniauth.auth']).id
    flash[:notice] = 'ユーザ認証が完了しました。'
    redirect_to root_path
  end

  def destroy
    reset_session
    flash[:notice] = 'ログアウトしました。'
    redirect_to root_path
  end

  private

  def authenticate_user(auth)
    user = User.find_or_create_by(uid: auth[:uid])
    user.update!(
      nickname: auth[:info][:nickname]
    )
    user
  end
end
