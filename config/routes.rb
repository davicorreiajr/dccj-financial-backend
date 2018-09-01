Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :show, :update]

  resources :accounts, only: [:show] do
    resources :transactions, only: [:index, :create, :update, :destroy]
  end
end
