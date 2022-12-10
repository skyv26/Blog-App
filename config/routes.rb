Rails.application.routes.draw do
  root "users#index"

  # Users
  get 'users/:id' => 'users#show'

  # Posts
  get 'users/:user_id/posts' => 'posts#index'
  # get 'users/:id/posts/:id' => 'users#post_id'
end
