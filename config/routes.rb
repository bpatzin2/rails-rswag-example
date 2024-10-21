Rails.application.routes.draw do
  namespace :internal do
    mount Rswag::Ui::Engine => '/api-docs', as: 'internal_swagger_ui'
    mount Rswag::Api::Engine => '/api-docs'
    resources :projects, only: [:index, :create]
  end

  namespace :customers do
    mount Rswag::Ui::Engine => '/api-docs', as: 'customers_swagger_ui'
    mount Rswag::Api::Engine => '/api-docs'
    resources :projects, only: [:index, :create]
  end
end