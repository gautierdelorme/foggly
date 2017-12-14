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

  resources :user_groups do
    resources :memberships, only: %i[index create destroy]
  end

  resources :data_sources do
    resources :data_endpoints do
      resources :data_requests, only: %i[index show create new] do
        resources :data_request_diffs, only: %i[index show]
        resources :data_request_reports, only: %i[index update]
      end
    end
  end

  resources :data_reports do
    resources :data_report_requests, only: :index
  end
end
