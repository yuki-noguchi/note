Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources 'articles' do
    member do
      post 'purchase'
    end
  end
  resources 'groups' do
    resources 'messages'
  end
  resources 'users', only: [:show] do
    collection do
      get 'search'
    end
  end
end
