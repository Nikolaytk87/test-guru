# frozen_string_literal: true

Rails.application.routes.draw do
  get 'about/index'
  get '/about', to: 'about#about'
  get '/about/author', to: 'about#author'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
