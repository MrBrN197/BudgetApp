Rails.application.routes.draw do
  devise_for :users
  root 'splash#index'

  resources :categories, only: [:index, :show] do
    resources :records, only: [:index, :show]
  end

end
