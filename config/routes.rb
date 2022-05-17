Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :lives do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[index edit show update]
  get '/my-lives', to: 'lives#my_lives'
  get '/my-booking-requests', to: 'bookings#requests', as: :requests
end
