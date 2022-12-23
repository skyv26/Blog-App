require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'show page' do
    before(:each) do
      @first_user = User.create(name: 'Tom', photo: 'https://www.shutterstock.com/image-photo/los-angeles-feb-18-tom-260nw-1649457931.jpg', bio: 'Teacher from Mexico.')
      @second_user = User.create(name: 'Lilly', photo: 'https://www.hollywoodreporter.com/wp-content/uploads/2022/07/Lily-Singh-The-Bad-Guys-Screening-GettyImages-1391141762-H-2022.jpg', bio: 'YouTuber from America')

      @first_post = Post.create(author: @first_user, title: 'Hello', text: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.')
      @second_post = Post.create(author: @second_user, title: 'Hello 1', text: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).')
      @third_post = Post.create(author: @second_user, title: 'Hello 2', text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')
      @fourth_post = Post.create(author: @second_user, title: 'Hello 3', text: 'here are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.')

      Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom!')
      Comment.create(post: @second_post, author: @first_user, text: 'Hi Lilly, Your first article is awesome!')
      Comment.create(post: @fourth_post, author: @second_user, text: 'Hi Lilly, Your second article is awesome!')
      Comment.create(post: @first_post, author: @first_user, text: 'Hi Tom, Another wonderful blog!')
      Comment.create(post: @first_post, author: @first_user, text: 'Keep it Up!')
      Comment.create(post: @fourth_post, author: @second_user, text: 'Wonderful!')
      Comment.create(post: @first_post, author: @second_user, text: 'Hi Tom!')

      Like.create(post: @first_post, author: @second_user)
      Like.create(post: @first_post, author: @first_user)
      Like.create(post: @first_post, author: @first_user)
      Like.create(post: @fourth_post, author: @second_user)
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