Rails.application.routes.draw do
  get 'chat_rooms/show'

  devise_for :users

  resources :projects do
    resources :tasks, only: [:new, :create]
  end
  resources :tasks, only: [:destroy]


  resources :chat_rooms, only: [:show, :index, :new, :create] do
    resources :messages, only: [:create]
  end


  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
