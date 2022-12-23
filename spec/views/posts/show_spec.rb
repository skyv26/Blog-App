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

      visit post_id_path(@first_user.id, @first_post.id)
    end
    scenario 'can see the post\'s title' do
      expect(page).to have_content(@first_post.title)
    end

    scenario 'can see who wrote the post.' do
      expect(page).to have_content(@first_user.name)
    end

    scenario 'can see how many comments it has.' do
      expect(page).to have_content("Comments: #{@first_post.comments_counter}")
    end

    scenario 'can see how many likes it has.' do
      expect(page).to have_content("Likes: #{@first_post.likes_counter}")
    end

    scenario 'can see the post body.' do
      expect(page).to have_content(@first_post.text)
    end

    scenario 'can see the username of each commentor.' do
      @first_post.comments.each do |comment|
        expect(page).to have_content(comment.author.name)
      end
    end

    scenario 'can see the comment each commentor left.' do
      @first_post.comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end
end
