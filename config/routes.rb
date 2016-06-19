Rails.application.routes.draw do
  get 'relations' => 'relations#index'
  get 'relations/validate' => 'relations#validate'

  resources :relation_ratings, only: [:create, :update]

  get 'welcome/index'
  root 'welcome#index'

  devise_for :users
end
