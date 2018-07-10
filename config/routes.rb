Rails.application.routes.draw do

  get 'responses/ranking' => 'responses#ranking'
  resources :responses 
  resources :questions
  resources :users

  root 'welcome#index'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :projects, controller: "projects"
  get "/your_projects" => "projects#your_projects", as: "your_projects"
  post "projects/add_users" => "projects#add_users", as: "add_users"
  post "projects/complete_project" => "projects#complete_project", as: "complete_project"
  get "/user" => "users#user_profile", as: "user_profile"
  get '/users/upload' => 'users#upload_avatar', as: 'upload_avatar'
  get '/your_reviews' => 'users#your_reviews', as: 'your_reviews'
end