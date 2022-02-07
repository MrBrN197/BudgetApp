Rails.application.routes.draw do
  devise_for :users
  get '/user', to: 'categories#index', as: :user_root

  root 'splash#index'

  resources :categories do
    resources :records, only: [:index, :show]
  end

end
