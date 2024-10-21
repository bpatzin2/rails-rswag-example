Rails.application.routes.draw do
  namespace :internal do
    get 'api-docs', to: 'swagger#index'
    mount Rswag::Api::Engine => '/api-docs'
    resources :projects, only: [:index, :create]
  end

  namespace :customers do
    get 'api-docs', to: 'swagger#index'
    mount Rswag::Api::Engine => '/api-docs'
    resources :projects, only: [:index, :create]
  end
end