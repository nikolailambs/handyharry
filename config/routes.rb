Rails.application.routes.draw do
  devise_for :clients
  devise_for :handies

<<<<<<< HEAD
  resources :projects do
    resources :tasks, except: [:shwow]
=======

  namespace :handies do
    resources :projects do
      resources :tasks
    end

    resources :messages, except: [:update, :edit]
>>>>>>> e45151368b372112c0d92812df85d9d4346242ad
  end


  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
