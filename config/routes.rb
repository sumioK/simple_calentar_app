Rails.application.routes.draw do
  root 'reservationcs#index'

  resources :reservationcs
end
