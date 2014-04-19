NkuProject::Application.routes.draw do
  root to: 'users#index' #Rails Root location to start looking pages
    post "users/upload", to: "users#upload", as: :users_upload
resources :sessions, :invoices, :users

end
