Rails.application.routes.draw do
  root "users#index"

  get 'users/:id' => 'users#show'
  # get 'users/:id/posts' => 'users#posts'
  # get 'users/:id/posts/:id' => 'users#post_id'
end
