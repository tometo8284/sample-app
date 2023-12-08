Rails.application.routes.draw do
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  devise_for :users
  root to: "homes#top"
  get 'lists/search', to: 'lists#search'
  resources :lists, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
    resources :list_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :carts, only: [:index, :create, :update]
  resources :users, only: [:show, :edit, :update]
  resources :categories, only: [:index, :create, :edit, :update]
  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
