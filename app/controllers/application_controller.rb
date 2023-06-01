# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # MEMO: :"authenticate_user!"はログインしていない場合ログインページに飛ばす記述
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name role])
  end

  def after_sign_in_path_for(_resource)
    general_index_path
  end

  # MEMO: :Slackのnew_userチャンネル通知用
  def hello
    client = Slack::Web::Client.new
    client.chat_postMessage(
      channel: '#random',
      text: '通知テスト'
    )
  end
end
