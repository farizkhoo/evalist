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
end
