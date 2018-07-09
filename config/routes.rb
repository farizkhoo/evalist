Rails.application.routes.draw do

  resources :responses 
  resources :questions
  resources :users

  get 'questions/tags' => 'questions#tags'
  root 'welcome#index'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :projects, controller: "projects"
  get "/your_projects" => "projects#your_projects", as: "your_projects"
<<<<<<< Updated upstream
=======
  post "projects/add_users" => "projects#add_users", as: "add_users"
  post "projects/complete_project" => "projects#complete_project", as: "complete_project"
  get "/user" => "users#user_profile", as: "user_profile"
  get '/users/upload' => 'users#upload_avatar', as: 'upload_avatar'
>>>>>>> Stashed changes
end
