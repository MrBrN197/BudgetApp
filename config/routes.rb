Rails.application.routes.draw do
  root 'splash#index'

  resources :categories, only: [:index, :show] do
    resources :records, only: [:index, :show]
  end

end
