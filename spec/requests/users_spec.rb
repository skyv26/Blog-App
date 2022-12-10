require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do

    it 'should be passed with status 200' do
      get ''
      expect(response.status).to eql(200)
    end

    it 'should be passed with correct template' do
      get '/'
      expect(response).to render_template(:index)
    end

    it 'should be passed with correct placeholder text' do
      get '/'
      expect(response.body).to match(/List of All Users/) 
    end
  end

  describe "GET /users/:id" do

    it 'should be passed with status 200' do
      get '/users/45'
      expect(response.status).to eql(200)
    end

    it 'should be passed with correct template' do
      get '/users/45'
      expect(response).to render_template(:show)
    end

    it 'should be passed with correct placeholder text' do
      get '/users/45'
      expect(response.body).to match(/45/) 
    end
  end
end
