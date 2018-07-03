Rails.application.routes.draw do
  resources :questions
  get 'questions/tags' => 'questions#tags'

end
