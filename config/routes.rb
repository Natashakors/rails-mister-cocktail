Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :doses, only: [ :new, :create ]
  end
#  resources :doses, only: [:destroy
  delete '/doses/:id', to: 'doses#destroy', as: 'dose'
  root 'cocktails#index'
end
