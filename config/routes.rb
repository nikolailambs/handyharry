Rails.application.routes.draw do
  devise_for :users

  resources :projects do
    resources :tasks, only: [:new, :create]
  end
  resources :tasks, only: [:destroy]

  get '/inbox', to: 'messages#inbox', as: 'inbox'
  get '/inbox/:id/messages', to: 'messages#index', as: 'conversation'
  resources :messages, except: [:index, :show, :update, :edit]


  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
