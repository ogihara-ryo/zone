class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  before_action :login_required

  private

  def current_user
    return unless session[:user_id]

    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    session[:user_id].present?
  end

  def authenticate
    return if logged_in?

    redirect_to root_path, alert: 'ログインしてください'
  end

  def login_required
    redirect_to root_path unless current_user
  end
end
