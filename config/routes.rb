Rails.application.routes.draw do
  
  # FRONT-END
  devise_for :users

  resources :teams
  resources :players do
    get 'brokerbasket', on: :collection
    get 'historico', on: :collection
    get 'mejores_jornada', on: :collection
    get 'comparar', on: :collection
    post "search", on: :collection
  end
  resources :games
  
  get 'games/:round_id/round' => 'games#round', as: :games_round
  
  # BACK-END
  namespace :admin do
    resources :teams
    resources :players do
      get 'import', on: :collection
      get 'calculate_prices', on: :collection
      get 'comparar', on: :collection
    end
    resources :games do
      get 'import', on: :collection
      get 'import_table', on: :collection
    end
    resources :statistics do
      get  'import', on: :collection
    end
    resources :settings
  end
  

  # ROOT
  authenticated :user do
    root :to => "admin/home#index", :as => :authenticated_root
  end

  root "home#index"

end
