# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    if current_user.master?
      @users = User.page(params[:page]).per(10)
    elsif current_user.admin?
      @users = User.where.not(role: :master).page(params[:page]).per(10)
    end
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to members_path
      flash[:success] = 'ユーザを登録しました'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to members_path
      flash[:success] = 'ユーザを更新しました'
    else
      render :edit
    end
  end

  def destroy
    if @user.update(discarded_at: Time.zone.now)
      flash[:success] = 'ユーザを削除しました'
    else
      flash[:alert] = 'ユーザの削除に失敗しました'
    end
    redirect_to members_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :role, :icon, :organization_id)
  end
end
