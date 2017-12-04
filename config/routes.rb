Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :projects do
    resources :tasks, only: [:new, :create, :destroy, :update, :edit]
  end


  resources :chat_rooms, only: [:show, :index, :new, :create] do
    resources :messages, only: [:create]
  end


  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # messanger
  mount ActionCable.server => "/cable"
end
