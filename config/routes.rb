Rails.application.routes.draw do
  get '/articles/:id', to: 'articles#index'
  resources :articles, only: %i[index show]
end
