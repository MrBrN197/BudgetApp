Rails.application.routes.draw do
  devise_for :users

  root 'splash#index'

  resources :categories do
    resources :records
  end
end
