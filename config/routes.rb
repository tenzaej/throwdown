Rails.application.routes.draw do
  get 'login' => 'session#new'
  post 'login' => 'session#login'
  get 'logout' => 'sessions#logout'
end
