Rails.application.routes.draw do
  devise_for :users

  root "users#index", as: :start

  devise_scope :users do
    root to: 'devise/sessions#new'
  end

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts do
          resources :comments
          resources :likes
      end
    end
  end

  end

  
  # Users
  get 'users/:id' => 'users#show', as: :user_id

  # Posts
  get 'users/:user_id/posts' => 'posts#index', as: :all_post
  get 'users/:user_id/posts/new' => 'posts#new', as: :post_new
  post 'users/:user_id/posts/new' => 'posts#create', as: :post
  get 'users/:user_id/posts/:id' => 'posts#show', as: :post_id
  delete 'users/:user_id/posts/:id' => 'posts#destroy'

  #Comments

  get 'users/:user_id/posts/:id/comments/new' => 'comments#new', as: :comments_new
  post 'users/:user_id/posts/:id/comments' => 'comments#create', as: :comment
  delete 'users/:user_id/posts/:id/comment/:comment_id' => 'comments#destroy', as: :comment_destroy

  #likes
  get 'users/:user_id/posts/:id/likes/new' => 'likes#create', as: :likes_create

end
