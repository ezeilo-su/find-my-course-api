Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      post :signup, to: 'user_registration#create'
      post 'login', to: 'authentication#create'
      # post 'logout', to: 'authentication#destroy'
      resources :courses, only: [:index, :show], param: :slug
      resources :favorites, only: [:create, :destroy, :index], param: :slug
    end
  end
end
