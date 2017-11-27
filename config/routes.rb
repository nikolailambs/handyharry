Rails.application.routes.draw do
  devise_for :clients
  devise_for :handies

  resources :projects do
    resources :tasks, except: [:shwow]
  end

  resources :messages, except: [:update, :edit]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
