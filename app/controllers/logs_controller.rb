# frozen_string_literal: true

class LogsController < ApplicationController
  def index
    @organizations = Organization.unscope(:where).where.not(discarded_at: nil)
  end
end
