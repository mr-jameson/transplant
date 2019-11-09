Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # homepage route
  get "/", to: "pages#home", as: "root"

  # plants full CRUD routes
  get "/plants", to: "plants#index", as: "plants"
  post "/plants", to: "plants#create"
  get "/plants/new", to: "plants#new", as: "new_plant"
  get "/plants/:id", to: "plants#show", as: "plant"
  patch "/plants/:id", to: "plants#update"
  get "/plants/:id/edit", to: "plants#edit", as: "edit_plant"
  delete "/plants/:id", to: "plants#destroy"

  # users full CRUD routes
  get "/users/log_out", to: "pages#destroy", as: "log_out"
  get "/users/:id", to: "users#show", as: "user"
  patch "/users/:id", to: "users#update"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"

  # payment routes
  get "/payments/success", to: "payments#success", as: "success_payment"
  post "/payments/webhook", to: "payments#webhook", as: "webhook_payment"
end
