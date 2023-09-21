class UsersController < ApplicationController

  def index
    if current_user.master?
      @users = User.page(params[:page]).per(10)
    elsif current_user.admin?
      @users = User.where.not(role: :master).page(params[:page]).per(10)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
      flash[:success] = 'ユーザーを登録しました'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to master_index_path
      flash[:success] = 'ユーザーを更新しました'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role, :icon, :organization_id)
  end


end
