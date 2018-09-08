Rails.application.routes.draw do
  resources :documents
  resources :landlords do
    collection do
      post :fabricate
    end
  end
  resources :commissions do
    collection do
      get :add_tenant_to
      post :fabricate
      get :prune
    end
    member do
      put :submit
      put :follow_up
    end
  end
  resources :assists
  resources :assistants
  resources :deals do
    collection do
      post :fabricate
      get :prune
    end
    member do
      get :pick_status_of
    end
  end
  root :to => 'home#landing'
  devise_for :agents
  resources :agents, :only => [:index, :show, :edit, :update]
  resources :apartments
  resources :social_accounts
  resources :emails
  resources :phones
  resources :niches
  resources :industries
  resources :employments
  resources :employers
  resources :leases
  resources :registrants
  resources :clients
  resources :referral_sources
  resources :registrations
  get '/register' => 'home#registration', :as => 'begin_registration'
  post '/register' => 'home#submit', :as => 'submit_registration'
end
