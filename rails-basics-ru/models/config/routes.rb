# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  # BEGIN
  get 'articles/index', to: 'articles#index'
  get 'articles/show/:id', to: 'articles#show', as: 'articles_show'
  # END
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
