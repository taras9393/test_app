Rails.application.routes.draw do
  get 'sessions/new'
  root 'statpages#home'
  get 'home' => 'statpages#home'
  get 'about' => 'statpages#about'
  get 'contacts' => 'statpages#contacts'
  get 'animals' => 'statpages#animal_list'

  get "signup" => "users#new"

  resources :users

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
end
