# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: second_user, title: 'Hello 1', text: 'This is my first post')
third_post = Post.create(author: second_user, title: 'Hello 2', text: 'This is my second post')
fourth_post = Post.create(author: second_user, title: 'Hello 3', text: 'This is my third post')

Comment.create(post: first_post, author: first_user, text: 'Hi Tom!')
Comment.create(post: second_post, author: second_user, text: 'Hi Lilly, Your first article is awesome!')
Comment.create(post: fourth_post, author: second_user, text: 'Hi Lilly, Your second article is awesome!')
Comment.create(post: first_post, author: first_user, text: 'Hi Tom, Another wonderful blog!')
Comment.create(post: first_post, author: first_user, text: 'Keep it Up!')
Comment.create(post: fourth_post, author: second_user, text: 'Wonderful!')

Like.create(post: first_post, author: first_user)
Like.create(post: first_post, author: first_user)
Like.create(post: first_post, author: first_user)
Like.create(post: fourth_post, author: second_user)
Like.create(post: fourth_post, author: second_user)
Like.create(post: fourth_post, author: second_user)
Like.create(post: fourth_post, author: second_user)
Like.create(post: fourth_post, author: second_user)
