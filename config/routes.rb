Rails.application.routes.draw do

  resources :questions
  get 'questions/tags' => 'questions#tags'
  root 'welcome#index'
end
