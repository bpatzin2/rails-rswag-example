Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :internal do
    resources :projects, only: [:index, :create]
  end

  namespace :customers do
    resources :projects, only: [:index, :create]
  end

  namespace :workers do
    resources :projects, only: [:index, :create]
  end
end