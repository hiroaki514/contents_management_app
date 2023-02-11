# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'comments#index'

  resources :master
  resources :admin
  resources :general
end
