Rails.application.routes.draw do
  root 'statpages#home'
  get 'home' => 'statpages#home'
  get 'about' => 'statpages#about'
  get 'contacts' => 'statpages#contacts'
  get 'animals' => 'statpages#animal_list'

  get "signup" => "users#new"
end
