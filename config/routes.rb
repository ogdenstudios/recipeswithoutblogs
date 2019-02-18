Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "recipes#index"

  get "/about", to: "pages#about"
  get "/privacy-policy", to: "pages#privacy_policy"
  get "/recipes/mine", to: "recipes#mine"
  get "/recipes/meal", to: "recipes#meal"
  resources :recipes

end
