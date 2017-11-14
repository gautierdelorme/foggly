Rails.application.routes.draw do
  authenticated :user do
    root 'home#index', as: :auth_root
  end
  root to: redirect('/users/sign_in')

  devise_for :users

  resources :conversations, only: %i[index show create] do
    resources :messages, only: :create
  end

  resources :users, only: %i[index show]
end
