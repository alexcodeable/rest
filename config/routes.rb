Rails.application.routes.draw do

  resources :order_items
  get 'cart', to: 'cart#show'
  resources :categories
  resources :products
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  devise_scope :user do
    get 'sign_up', to: 'devise/registrations#new'
    post 'sign_up', to: 'devise/registrations#create'
    get 'sign_in', to: 'devise/sessions#new'
    post 'sign_in', to: 'devise/sessions#create'
    get 'sign_out', to: 'devise/sessions#destroy', as: :sign_out
    delete 'sign_out', to: 'devise/sessions#destroy'
    get 'account-settings', to: 'devise/registrations#edit'
    get 'forget-pass', to: 'devise/passwords#new'
  end

  get 'about', to: 'home#about'
  get 'orders', to: 'home#orders'
  get 'notifications', to: 'home#notifications'
  get 'contact', to: 'home#contact'
  get 'invoice', to: 'products#invoice'
  get 'menu', to: 'products#index'
  get 'catering', to: 'home#catering'

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
