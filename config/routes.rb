Rails.application.routes.draw do
  devise_for :users
  root 'application#index'

  namespace :api do
    resources :terms do
      resources :subjects do
        resources :labs
      end
    end

    resources :teachers
    resources :marks
  end
end
