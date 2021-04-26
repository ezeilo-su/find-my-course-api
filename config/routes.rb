Rails.application.routes.draw do
  post :signup, to: 'user_registration#create'
  
  namespace :api do
    namespace :v1 do
      post 'authenticate', to: 'authentication#create'
    end
  end
end
