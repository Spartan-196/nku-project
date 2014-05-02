NkuProject::Application.routes.draw do
  root to: 'customers#index' #Rails Root location to start looking pages
    post "users/upload", to: "users#upload", as: :users_upload
    post "customers/upload", to: "customers#upload", as: :customers_upload
resources :sessions, :users, :customers #,:invoices

end
