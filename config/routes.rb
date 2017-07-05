Rails.application.routes.draw do
  root to: 'client_issues#new'

  resources :client_issues, only: [:new, :create, :edit, :update] do
    get :show_by_uu_id, on: :collection
  end

  devise_for :users
  resources :issues

end
