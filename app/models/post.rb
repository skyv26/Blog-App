class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User'
  before_save :post_count

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def post_count
    author.update(posts_counter: author.posts.all.length)
  end
end
