Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      post :signup, to: 'user_registration#create'
      post 'authenticate', to: 'authentication#create'
      resources :courses, only: [:index, :show], param: :slug
    end
  end
end
