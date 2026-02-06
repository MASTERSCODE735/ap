Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  post 'users/send_otp', to: 'users/sessions#send_otp', as: :send_otp_user_session

  resources :users, only: [:new, :create] do
    collection do
      post :otp_login
      get :verify_otp
      post :verify_otp
    end
  end

  resources :expenses, only: [:index]

  root to: 'home#index'
end
