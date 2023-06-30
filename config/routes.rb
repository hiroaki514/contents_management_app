# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'comments#index'

  resources :master
  resources :admin
  resources :general

  get 'hello', to: 'application#hello'
end
