# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # MEMO: :"authenticate_user!"はログインしていない場合ログインページに飛ばす記述
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name role])
  end

  def after_sign_in_path_for(resource)
    general_index_path
  end

end
