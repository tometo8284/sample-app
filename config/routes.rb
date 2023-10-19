Rails.application.routes.draw do
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  devise_for :users
  root to: "homes#top"
  resources :lists, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
    resources :list_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
