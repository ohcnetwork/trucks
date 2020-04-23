Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'registrations' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'entries#index'

  get 'find_phone' => "contacts#find_phone"

  get 'list', to: 'entries#list'
  resources :entries, only: [:index, :show, :new, :create, :update, :edit] do
  end
  resources :vehicles, only: [:show] do
  end
end
