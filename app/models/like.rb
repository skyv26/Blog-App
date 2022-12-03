class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  before_save :like_counter

  def like_counter
    post.update(likes_counter: post.likes.all.length)
  end
end
