Rails.application.routes.draw do
  authenticated :user do
    root 'home#index', as: :auth_root
  end
  root to: redirect('/users/sign_in')

  devise_for :users
end
