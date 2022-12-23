require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'show page' do
    before(:each) do
      @first_user = User.create(name: 'Tom',
                                photo: 'https://shorturl.at/gimsH', bio: 'Teacher from Mexico.')
      @second_user = User.create(name: 'Lilly',
                                 photo: 'https://shorturl.at/foAO2', bio: 'YouTuber from America')

      @first_post = Post.create(author: @first_user, title: 'Hello',
                                text: 'Lorem ipsum dolor sit amet. Aut deleniti repudiandae')
      @second_post = Post.create(author: @second_user, title: 'Hello 1',
                                 text: 'Ex officia expedita qui optio nostrum. Et excepturi')

      Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom!')
      Comment.create(post: @second_post, author: @first_user, text: 'Hi Lilly, Your first article is awesome!')
      Comment.create(post: @fourth_post, author: @second_user, text: 'Hi Lilly, Your second article is awesome!')
      Comment.create(post: @first_post, author: @first_user, text: 'Hi Tom, Another wonderful blog!')

      Like.create(post: @first_post, author: @second_user)
      Like.create(post: @first_post, author: @first_user)
      @users = User.all

      visit user_id_path(@first_user.id)
    end

    scenario 'can see the user\'s profile picture.' do
      expect(page).to have_css("img[src*='#{@first_user.photo}']")
    end

    scenario 'can see the user\'s username.' do
      expect(page).to have_content(@first_user.name)
    end

    scenario 'can see the number of posts the user has written' do
      expect(page).to have_content("Number of posts: #{@first_user.posts_counter}")
    end

    scenario 'can see the user\'s bio.' do
      expect(page).to have_content(@first_user.bio)
    end

    scenario 'can see the user\'s first 3 posts.' do
      @posts = @first_user.posts
      @posts.each do |post|
        expect(page).to have_content(post.text[0..120])
      end
    end

    scenario 'can see a button that lets me view all of a user\'s posts' do
      expect(page).to have_content('See All Post')
    end

    scenario 'can see when click on particular post, it redirects me to that post\'s show page' do
      click_link 'See All Post'
      click_link 'Post'
      expect("#{page.current_url}/posts/#{@first_post.id}").to match post_id_path(@first_user, @first_post)
    end

    scenario 'can see when click see all posts, it redirects me to that user\'s post\'s index page' do
      click_link 'See All Post'
      expect("#{page.current_url}/posts").to match all_post_path(@first_user.id)
    end
  end
end
