Rails.application.routes.draw do
  resources :homes
  post 'register_user' => 'registrations#create'
end
