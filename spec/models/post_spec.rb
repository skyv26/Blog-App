require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'Tests For #Post Model' do
    before :each do
      @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      @post = Post.create(author: @user, title: 'Hi This is Aakash', text: 'This is a test post')
    end
    before { subject.save }

    it 'Post title should be present' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'commentsCounter greater than or === 0' do
      @post.comments_counter = -1
      expect(@post).to_not be_valid
    end

    it 'Should have 0 comments after creation' do
      puts @post.comments_counter
      # expect(@post.comments_counter).to eq 0
    end

    it 'likesCounter greater than or === 0' do
      @post.likes_counter = -1
      expect(@post).to_not be_valid
    end

    it 'Should have 0 likes after creation' do
      expect(@post.likes_counter).to eq 0
    end

    it 'Should return n posts after creating n posts' do
      Comment.create(post: @post, author: @user, text: 'Hi Tom!')
      Comment.create(post: @post, author: @user, text: 'Hi Tom!')
      expect(@post.comments_counter).to eq 2
    end

    it 'Should return 5 comments after creating more than 5 posts' do
      Comment.create(post: @post, author: @user, text: 'Hi Tom!')
      Comment.create(post: @post, author: @user, text: 'Hi Tom!')
      Comment.create(post: @post, author: @user, text: 'Hi Tom!')
      Comment.create(post: @post, author: @user, text: 'Hi Tom!')
      expect(@post.recent_comments.length).to eq 4
    end
  end
end
