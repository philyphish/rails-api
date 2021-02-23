Rails.application.routes.draw do
  # get '/articles/:id', to: 'articles#show'
  resources :articles, only: %i[index show]
end
