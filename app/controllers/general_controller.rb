# frozen_string_literal: true

class GeneralController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to general_index_path, notice: '投稿が完了しました'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to general_index_path, notice: '削除が完了しました'
  end

  private

  def post_params
    params.permit(:body, :user_id, :video)
  end
end
