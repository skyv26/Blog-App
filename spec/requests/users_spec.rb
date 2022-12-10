require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it 'should be passed with status 200' do
      get ''
      expect(response.status).to eql(200)
    end
  end
end
