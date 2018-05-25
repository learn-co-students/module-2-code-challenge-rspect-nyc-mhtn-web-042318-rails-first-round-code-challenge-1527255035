Rails.application.routes.draw do
  resources :superpowers, only: [:index, :show, :new, :create, :edit, :update]
  resources :superheroes, only: [:index, :show, :new, :create, :edit, :update]

end
