# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params.require(:user).permit(:name, :email))
    @user.save
  end
end
