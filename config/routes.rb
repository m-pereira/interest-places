Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :interest_places
      get 'search_places', to: 'interest_places#search'
    end
  end
end
