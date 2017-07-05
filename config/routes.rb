Rails.application.routes.draw do
  root to: 'client_issues#new'

  resources :client_issues, only: [:new, :create] do
    get :show_by_uu_id, :edit_by_uu_id, on: :collection

    put :update_by_uu_id, on: :collection
    patch :update_by_uu_id, on: :collection
  end

  devise_for :users
  resources :issues, only: [:index, :show]

  resources :comments, only: [:new, :create, :destroy]
end
