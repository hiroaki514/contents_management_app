# frozen_string_literal: true

class MasterController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
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

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to master_index_path
      flash[:success] = 'ユーザを更新しました'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role, :icon, :organization_id)
  end
end
