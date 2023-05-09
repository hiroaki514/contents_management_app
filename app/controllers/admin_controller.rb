# frozen_string_literal: true

class AdminController < ApplicationController
  def index
    # @users = User.where(role: %i[admin general])
    @users = User.where.not(role: :master).page(params[:page]).per(3)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_index_path
      flash[:success] = 'ユーザを登録しました'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end
