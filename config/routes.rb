Rails.application.routes.draw do
  root to: 'client_issues#new'

  get 'client_issues/new'
  get 'client_issues/edit'
  get 'client_issues/show'

  devise_for :users
  resources :issues

end
