Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root 'api/users#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, except: %i[edit]
    end
  end
end
