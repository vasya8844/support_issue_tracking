Rails.application.routes.draw do
  resources :comments
  root to: 'client_issues#new'

  resources :client_issues, only: [:new, :create] do
    get :show_by_uu_id, :edit_by_uu_id, on: :collection

    put :update_by_uu_id, on: :collection
    patch :update_by_uu_id, on: :collection
  end

  devise_for :users
  resources :issues, only: [:index, :show]
end
