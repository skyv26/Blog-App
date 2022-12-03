require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Tests For #User Model' do
    before :each do
      @user = User.create(name: 'Aakash', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'My name is Aakash')
    end

    describe 'Unit Test For @user object' do
      it 'it will check @user should not be valid' do
        expect(@user).to be_valid
      end

      it 'it will check name should be "Aakash"' do
        expect(@user.name).to eql 'Aakash'
      end
    end

    describe 'Unit Test For @user object methods' do
      it 'it will check @user recents post should be []' do
        expect(@user.recent_posts.length).to eql 0
      end
    end
  end
end
