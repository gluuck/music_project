Rails.application.routes.draw do
  
  resources :downloads
  resources :artists do
    resources :tracks
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
