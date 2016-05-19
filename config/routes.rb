Rails.application.routes.draw do

  resources :lists do
    resources :tasks do
      member do
        patch :complete
      end
    end
  end

  root "lists#index"
  # get 'demo/index'
  match ':controller(/:action(/:id(/:page)))', :via => :get
end
