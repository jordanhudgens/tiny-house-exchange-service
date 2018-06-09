Rails.application.routes.draw do
  post 'register_user' => 'registrations#create'
end
