Rails.application.routes.draw do
  
  # FRONT-END
  devise_for :users

  resources :teams
  resources :players do
    collection do 
      get :brokerbasket
      get :historico
      get :mejores_jornada
      get :comparar
      get :search
    end
  end
  resources :games
  
  get 'games/:round_id/round' => 'games#round', as: :games_round
  
  # BACK-END
  namespace :admin do
    resources :teams
    resources :players do
      collection do 
        get :import
        get :calculate_prices
        get :comparar
      end
    end
    resources :games do
      collection do 
        get :import
        get :import_table
      end
    end
    resources :statistics do
      collection do 
        get :import
      end
    end
    resources :settings
  end
  

  # ROOT
  authenticated :user do
    root :to => "admin/home#index", :as => :authenticated_root
  end

  root "home#index"

end
