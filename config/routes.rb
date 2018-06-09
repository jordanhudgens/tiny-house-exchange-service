Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  post 'register_user' => 'registrations#create'
end
