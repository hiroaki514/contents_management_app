# frozen_string_literal: true

class LogsController < ApplicationController
  before_action :fetch_log_types, only: %i[index]
  def index
    # 表示用に @logs 内のデータをソートする
    @logs = @logs.sort_by(&:discarded_at).reverse
  end

  private

  def fetch_log_types
    # case でログのタイプ毎に分岐
    @logs = case params[:log_type]
            when 'organization'
              organization_logs
            when 'user'
              user_logs
            else
              all_logs
            end
  end

  def all_logs
    (user_logs + organization_logs)
  end

  def user_logs
    fetch_logs_with_discarded_at(User) +
    fetch_logs_with_created_user_id(User)
  end

  def organization_logs
    fetch_logs_with_discarded_at(Organization) +
    fetch_logs_with_created_user_id(Organization)
  end

  # モデルに記述したデフォルトスコープを無視して discarded_at が nil でないものを取得
  def fetch_logs_with_discarded_at(model)
    model.unscope(:where).where.not(discarded_at: nil)
  end

  def fetch_logs_with_created_user_id(model)
    model.where.not(created_user_id: nil)
  end


end
