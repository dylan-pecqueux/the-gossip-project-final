Rails.application.routes.draw do
  resources :gossips, only: [:new, :create, :index, :show]
  get '/user/:user_profile', to: 'user#user_profile', as: 'user'
  get 'welcome/:first_name', to: 'welcome#first_name'
  get '/static_pages/contact', to: 'static_pages#contact'
  get '/static_pages/team', to: 'static_pages#team'
  get '/static_pages/home', to: 'static_pages#home'
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
