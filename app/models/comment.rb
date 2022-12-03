class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'
  before_save :comment_counter

  def comment_counter
    post.update(comments_counter: post.comments.all.length)
  end
end
