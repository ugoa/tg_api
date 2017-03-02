Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :csv_importings, only: [:index, :create]

  resources :logs, only: [:index]
end
