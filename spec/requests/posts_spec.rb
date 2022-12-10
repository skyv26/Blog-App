require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'should be passed with status 200' do
      get '/users/45/posts'
      expect(response.status).to eql(200)
    end

    it 'should be passed with correct template' do
      get '/users/45/posts'
      expect(response).to render_template(:index)
    end

    it 'should be passed with correct placeholder text' do
      get '/users/45/posts'
      expect(response.body).to include('List of all posts by user (45)')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'should be passed with status 200' do
      get '/users/45/posts/50'
      expect(response.status).to eql(200)
    end

    it 'should be passed with correct template' do
      get '/users/45/posts/50'
      expect(response).to render_template(:show)
    end

    it 'should be passed with correct placeholder text' do
      get '/users/45/posts/50'
      expect(response.body).to match(/User: 45, Post : 50/)
    end
  end
end
