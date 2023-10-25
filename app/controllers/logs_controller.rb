class LogsController < ApplicationController

  def index
    @organizations = Organization.where.not(discarded_at: nil)
  end

end
