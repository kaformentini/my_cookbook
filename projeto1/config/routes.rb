Rails.application.routes.draw do
  root to: 'recipes#index'

  resources :recipes, only: %i[index new create show edit update]
end
