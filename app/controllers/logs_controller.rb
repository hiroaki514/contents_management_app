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
    case params[:log_type]
    when 'organization'
      @logs = fetch_logs(Organization)
    when 'user'
      @logs = fetch_logs(User)
    else
      @logs = Organization.unscope(:where).where.not(discarded_at: nil) + User.unscope(:where).where.not(discarded_at: nil)
    end
  end

  # モデルに記述したデフォルトスコープを無視して discarded_at が nil でないものを取得
  def fetch_logs(model)
    model.unscope(:where).where.not(discarded_at: nil)
  end

end
