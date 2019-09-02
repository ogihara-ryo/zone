class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "ユーザー #{@user.nickname}さん を作成しました。"
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "ユーザー #{@user.nickname}さん を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: "ユーザー #{@user.nickname}さん を削除しました。"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password_digest, :uid, :last_logged_in_at)
  end
end
