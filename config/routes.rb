Rails.application.routes.draw do
  devise_for :clients
  devise_for :handies

  namespace :handies do
    resources :projects do
      resources :tasks, only: [:new, :create]
    end
    resources :tasks, only: [:destroy]

    resources :messages, except: [:update, :edit]
  end


  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
