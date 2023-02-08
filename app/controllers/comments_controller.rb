# frozen_string_literal: true

class CommentsController < ApplicationController
  def index
    @users = User.all
  end
end
