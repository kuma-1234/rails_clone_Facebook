Rails.application.routes.draw do
  resources :sessions
  resources :users, only: [ :new, :create, :show ]
  resources :blogs do
    collection do
      post :confirm
    end
  end
end
