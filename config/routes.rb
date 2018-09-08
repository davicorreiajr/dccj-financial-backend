# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :users, only: [:create, :show, :update]

  resources :accounts, only: [:show] do
    resources :transactions, only: [:index, :create, :update, :destroy], shallow: true
  end
end
