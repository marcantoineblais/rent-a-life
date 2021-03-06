Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: 'pages#home'
  get '/user' => "lives#index", :as => :user_root

  resources :lives do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[index edit show update destroy]
  get '/my-lives', to: 'lives#my_lives'
  get '/my-booking-requests', to: 'bookings#requests', as: :requests
end
