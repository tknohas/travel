Rails.application.routes.draw do
  get 'home/index'
  root to: "home#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users
  resources :rooms do
    resources :reservations
    collection do
      get 'search'
    end
  end
  resources :reservations
  post 'reservations/confirm'
end
