Rails.application.routes.draw do
  # root "articles#index"

  resources :categories, only: [:index, :show] do
    resources :records, only: [:index, :show]
  end

end
