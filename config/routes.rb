Fbtab::Application.routes.draw do
  resources :tabs

  match 'tabs', to: 'photos#show', via: [:post]

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end