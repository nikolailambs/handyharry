Rails.application.routes.draw do

  devise_for :users

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
