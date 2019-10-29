Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "pages#home", as: "root"
  get "/plants", to: "plants#index", as: "plants"
  post "/plants", to: "plants#create"
  get "/plants/new", to: "plants#new", as: "new_plant"
  get "/plants/:id", to: "plants#show", as: "plant"
  patch "/plants/:id", to: "plants#update"
  get "/plants/:id/edit", to: "plants#edit", as: "edit_milkshake"
  delete "/plants/:id", to: "plants#destroy"
  get "/payment/success", to: "payments#success", as: "success_payment"
  post "/payment/webhook", to: "payments#webhook", as: "webhook_payment"
end
