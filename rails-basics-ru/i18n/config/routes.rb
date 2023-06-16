# frozen_string_literal: true

Rails.application.routes.draw do
  # BEGIN
  root 'home#index'
  
  scope ('/:locale'), locale: /en|ru/ do
    resources :posts do
      scope module: :posts do
        resources :comments, only: %i[edit create update destroy]
      end
    end
  end
  # END
end
