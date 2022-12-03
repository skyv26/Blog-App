require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Tests For #Comment Model' do
    before :each do
      @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

      @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
  
      @comment = Comment.create(post: @post, author: @user, text: 'Hi Tom!')
    end

    it 'Comments counter will be incremented' do
      expect(@post.comments_counter).to eq 1
    end
  end
end
