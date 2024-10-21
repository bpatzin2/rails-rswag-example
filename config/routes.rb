Rails.application.routes.draw do
  scope '/test-path' do
    mount Rswag::Ui::Engine => '/api-docs'
    mount Rswag::Api::Engine => '/api-docs'
  end

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