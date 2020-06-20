Rails.application.routes.draw do
  get '/api/v1/login', to: 'api/v1/sessions#create'
  namespace :api do 
    namespace :v1 do 
      resources :reviews
      resources :snacks
      resources :users
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
