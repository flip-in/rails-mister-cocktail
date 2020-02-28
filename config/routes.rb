Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  # resources :cocktails do
  #   resources :doses, only: [:new]
  # end
  #COCKTAILS
  get '/cocktails', to: 'cocktails#index', as: :cocktails
  get '/cocktails/new', to: 'cocktails#new', as: :new_cocktail
  get '/cocktails/:id', to: 'cocktails#show', as: :cocktail
  post '/cocktails', to: 'cocktails#create'
  delete '/cocktails/:id', to: 'cocktails#destroy'
  #DOSES
  get '/cocktails/:cocktail_id/doses/new', to: 'doses#new', as: :new_dose
  post '/cocktails/:cocktail_id/doses', to: 'doses#create', as: :cocktail_doses
  delete '/doses/:id', to: 'doses#destroy'

end
