require 'rails_helper'

RSpec.describe 'Posts', type: :system do
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
      Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom!')
      Comment.create(post: @second_post, author: @first_user, text: 'Hi Lilly, Your first article is awesome!')
      Comment.create(post: @fourth_post, author: @second_user, text: 'Hi Lilly, Your second article is awesome!')
      Comment.create(post: @first_post, author: @first_user, text: 'Hi Tom, Another wonderful blog!')

      Like.create(post: @first_post, author: @second_user)
      Like.create(post: @first_post, author: @first_user)

      @user = @first_user

      visit all_post_path(@first_user.id)
    end
    scenario 'can see the user\'s profile picture.' do
      expect(page).to have_css("img[src*='#{@first_user.photo}']")
    end

    scenario 'can see the user\'s username.' do
      expect(page).to have_content(@first_user.name)
    end

    scenario 'can see the number of posts the user has written.' do
      expect(page).to have_content("Number of posts: #{@first_user.posts_counter}")
    end

    scenario 'can see a post\'s title.' do
      expect(page).to have_content(@first_post.title)
    end

    scenario 'can see some of the post\'s body.' do
      expect(page).to have_content(@first_post.text[0..50])
    end

    scenario 'can see the first comments on a post.' do
      expect(page).to have_content(@first_post.comments.last.text)
    end

    scenario 'can see how many comments a post has.' do
      expect(page).to have_content("Comments: #{@first_post.comments_counter}")
    end

    scenario 'can see how many likes a post has.' do
      expect(page).to have_content("Likes: #{@first_post.likes_counter}")
    end

    scenario 'can see a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_content('Back')
      expect(page).to have_content('Next')
    end

    scenario 'can see When I click on a post, it redirects me to that post\'s show page.' do
      first('.post-container > a').click
      expect("#{page.current_url}/#{@first_post.id}").to match post_id_path(@first_user, @first_post)
    end
  end
end
