Rails.application.routes.draw do
  get 'activity_items/check_answer'
  get 'activities/show'
  get 'phrases/index'
  get 'phrases/audio'
  get 'sections/show'
  get 'units/index'
  get 'units/show'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  post 'users/send_otp', to: 'users/sessions#send_otp', as: :send_otp_user_session

  resources :users, only: [:new, :create] do
    collection do
      post :otp_login
      get :verify_otp
      post :verify_otp
    end
  end

  # Learning content
  resources :units, only: [:index, :show] do
    resources :sections, only: [:show] do
      resources :phrases, only: [:index] do
        member do
          get :audio   # stream audio for a single phrase
        end
      end
      resources :activities, only: [:show] do
        resources :activity_items, only: [] do
          member do
            post :check_answer
          end
        end
      end
    end
  end

  root to: 'units#index'
  get 'home', to: 'home#index', as: :home
  get 'about', to: 'home#about', as: :about
end