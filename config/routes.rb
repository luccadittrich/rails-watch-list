Rails.application.routes.draw do
  root to: 'lists#index'

  resources :lists do
    resources :favorites, only: %i[new create index show] do
      resource :cards
    end
  end

  resources :favorites, only: :destroy
  resources :cards, only: :index
end
