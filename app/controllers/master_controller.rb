# frozen_string_literal: true

class MasterController < ApplicationController
  def index
<<<<<<< HEAD
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
=======
    @users = User.all
>>>>>>> e9d578c (ユーザ一覧を表示)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to master_index_path
      flash[:success] = 'ユーザを登録しました'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role, :icon)
  end
end
