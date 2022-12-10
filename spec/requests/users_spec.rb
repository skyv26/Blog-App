require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do

    it 'should be passed with status 200' do
      get ''
      expect(response.status).to eql(200)
    end

    it 'should be passed with correct template' do
      get '/'
      expect(response.status).to render_template(:index)
    end

    it 'should be passed with correct placeholder text' do
      get '/'
      expect(response.body).to match(/List of All Users/) 
    end
  end
end
