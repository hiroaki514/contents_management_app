# frozen_string_literal: true

Slack.configure do |config|
  config.token = ENV.fetch('BOT_USER_ACCESS_TOKEN', nil)
end
