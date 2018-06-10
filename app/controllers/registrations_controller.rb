class RegistrationsController < ApplicationController
  include AuthTokenConcern

  def create
    user = User.create!(
      email: params['user']['email'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation'],
      auth_token: unique_auth_token
    )

    if user
      session[:user_id] = user.id
      cookies["tiny_house_exchange_user_id"] = { value: user.id, httponly: true }
      render json: { status: :created }
    else
      render json: { status: 500 }
    end
  end
end
