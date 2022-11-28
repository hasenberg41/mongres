# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    resources :people, only: %i[create index destroy]
    resources :documents, only: %i[create index destroy]
    resources :contracts, only: %i[create index destroy]
  end
end
