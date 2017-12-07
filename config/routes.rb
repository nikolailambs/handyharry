Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :status, only: [:index], controller: 'statuses'

  resources :projects do
    resources :tasks, only: [:new, :create, :destroy, :update, :edit]
  end


  resources :chat_rooms, only: [:show, :index, :new, :create] do
    resources :messages, only: [:create]
  end

  resources :users, only: [:show]

  get '/home', to: 'pages#home', as: 'home'

  root to: 'projects#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # messanger
  mount ActionCable.server => "/cable"
end
