Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources 'articles' do
    member do
      post 'purchase'
    end
  end
  resources 'users', only: [:show]
end
