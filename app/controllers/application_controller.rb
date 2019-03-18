class ApplicationController < ActionController::Base
  # ヘルパーから読み出すことができる。
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
