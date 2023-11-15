# frozen_string_literal: true

class LogsController < ApplicationController
  def index
    @organization_logs = Organization.unscope(:where).where.not(discarded_at: nil)
    @user_logs = User.unscope(:where).where.not(discarded_at: nil)
    
    # 表示させるデータをソートできるように以下で配列を作成
    @logs = (@organization_logs + @user_logs).sort_by(&:discarded_at).reverse
  end
end
