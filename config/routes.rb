Rails.application.routes.draw do

  resources :questions
  resources :users
  get 'questions/tags' => 'questions#tags'
  root 'welcome#index'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  resources :users, controller: "users", only: [:edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
