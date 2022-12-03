require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

    @post = Post.create(author: @post, title: 'Hello', text: 'This is my first post')

    @comment = Comment.create(post: @comment, author: @user, text: 'Hi Tom!')

    @like = Like.create(author: @author, post: @post)
  end

  it 'Comments author should equal to user who made the comment' do
    expect(@comment.author).to eq @user
  end
end
