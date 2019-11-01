Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "pages#home", as: "root"
  get "/plants", to: "plants#index", as: "plants"
  post "/plants", to: "plants#create"
  get "/plants/new", to: "plants#new", as: "new_plant"
  get "/plants/:id", to: "plants#show", as: "plant"
  patch "/plants/:id", to: "plants#update"
  get "/plants/:id/edit", to: "plants#edit", as: "edit_plant"
  delete "/plants/:id", to: "plants#destroy"
  get "/users/:id", to: "users#show", as: "user"
  get "/payments/success", to: "payments#success", as: "success_payment"
  post "/payments/webhook", to: "payments#webhook", as: "webhook_payment"
  get "/users/log_out", to: "pages#destroy", as: "log_out"
  # get "/users/:id/profile", to: "users#profile", as: "profile" 
end
