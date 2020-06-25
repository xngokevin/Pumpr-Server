Rails.application.routes.draw do

  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :authentication, only: [:create]

      resources :users do
        member do
          resources :photos
        end
      end

      resources :friendships do
        collection do
          get  :blocked_friends
        end
        member do
          post :send_request
          post :accept_request
          post :decline_request
          post :remove_friend
          post :block_friend
        end
      end
    end
  end
end
