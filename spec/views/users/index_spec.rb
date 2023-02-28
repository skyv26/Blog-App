require 'rails_helper'
RSpec.describe 'Users', type: :system do
  describe 'index page' do
    before(:each) do
      @first_user = User.create(name: 'Tom',
                                photo: 'https://shorturl.at/gimsH', bio: 'Teacher from Mexico.')
      @second_user = User.create(name: 'Lilly',
                                 photo: 'https://shorturl.at/foAO2', bio: 'YouTuber from America')

      @first_post = Post.create(author: @first_user, title: 'Hello',
                                text: 'Lorem ipsum dolor sit amet. Aut deleniti repudiandae')
      @second_post = Post.create(author: @second_user, title: 'Hello 1',
                                 text: 'Ex officia expedita qui optio nostrum. Et excepturi')

      @users = User.all
    end
    scenario 'can see the username of all other users.' do
      visit start_path
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end
    scenario 'can see the image of all users' do
      visit start_path
      @users.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end
    scenario 'can see the number of posts each user has written.' do
      visit start_path
      @users.each do |user|
        expect(page).to have_content("Number of posts: #{user.posts_counter}")
      end
    end
    scenario 'can see When I click on a user, I am redirected to that user\'s show page.' do
      visit start_path
      first('.users_container > a').click
      expect("#{page.current_url}/users/#{@first_user.id}").to match user_id_path(@first_user.id)
    end
  end
end
