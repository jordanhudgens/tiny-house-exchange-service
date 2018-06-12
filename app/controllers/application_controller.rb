class ApplicationController < ActionController::API
  before_action :current_user

  def current_user
    puts "Y" * 500, session[:user_id]
    if user_id = session[:user_id]
      @current_user ||= User.find(user_id)
    else
      nil
    end
  end
end
