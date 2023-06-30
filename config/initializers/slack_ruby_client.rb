# frozen_string_literal: true

Slack.configure do |config|
  config.token = Rails.application.credentials.dig(:slack, :secret_token)
end
