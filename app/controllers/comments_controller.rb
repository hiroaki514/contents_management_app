# frozen_string_literal: true

class CommentsController < ApplicationController
  def index
    @user = User.find(params[:id])
  end
end
