class SessionsController < ApplicationController
  include AuthenticationConcern
  skip_before_action :set_current_user, only: [:create]

  def create
    user = User
            .find_by(email: params['user']['email'])
            .try(:authenticate, params['user']['password'])

    if user
      session[:user_id] = user.id
      render json: { status: :created, user: user }
    else
      render json: { status: 500 }
    end
  end

  def logged_in
    if @current_user
      render json: { logged_in: true, user: @current_user }
    else
      render json: { logged_in: false }
    end
  end

  def logout
    reset_session
    render json: { status: 200 }
  end
end
