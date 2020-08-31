Rails.application.routes.draw do
#Setting it as "home" page for the server
  root "todos#index"
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #using "todos" mode
resources :todos
end
