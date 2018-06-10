class ApplicationController < ActionController::API
  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find(user_id)
    else
      nil
    end
  end
end
