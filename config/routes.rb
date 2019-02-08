Rails.application.routes.draw do
# =========================<< web routes >>================================
  root :to => "products#index"
  
  devise_for :users , :controllers => { registrations: 'registrations' }
  
  resources :products , only: [:index , :new , :create]  do
    member do
      get :favorite
    end
  end
# ===========================<< Apis Routes >>===============================
namespace :api do
  namespace :v1 do

    resources :products , only: [:create] do 
      collection do
        post :favorite
      end
    end
    resources :categories , only: [:create]
    
  end
end
# ============================================================================
end