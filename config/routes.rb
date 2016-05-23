Rails.application.routes.draw do
  namespace :api do
    resources :lists do
      resources :tasks do
        member do
          patch :complete
          patch :incomplete
        end
      end
    end
  end

  resources :lists do
    resources :tasks do
      member do
        patch :complete
        patch :incomplete
      end
    end
  end

  root "lists#index"
  # get 'demo/index'
  # match ':controller(/:action(/:id(/:page)))', :via => :get
end