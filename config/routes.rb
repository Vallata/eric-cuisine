Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#index"
  post '/contact', to: 'contacts#create'

  namespace :admin do
    resource  :session,        only: [:new, :create, :destroy]
    resources :content_blocks, only: [:update], constraints: { id: /[^\/]+/ }
    resources :images,         only: [:update], constraints: { id: /[^\/]+/ }
    resource  :coordonnees,    only: [:show, :update]
  end
end
