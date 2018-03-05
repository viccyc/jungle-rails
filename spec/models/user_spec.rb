require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save a user with both password and password confirmation present' do
      @user = User.new(
                first_name: 'Viccy',
                last_name: 'Carver',
                email: 'viccy@viccy.com',
                password: 'xxxxxx',
                password_confirmation: 'xxxxxx')
      @user.save!
      expect(@user).to be_present
    end
    it 'should throw a password required error when the password parameter is missing from user creation' do
      @user = User.new(
                first_name: 'Viccy',
                last_name: 'Carver',
                email: 'viccy@viccy.com',
                password_confirmation: 'xxxxxx')
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'should throw a password_confirmation required error when the password_confirmation parameter is missing from user creation' do
      @user = User.new(
                first_name: 'Viccy',
                last_name: 'Carver',
                email: 'viccy@viccy.com',
                password: 'xxxxxx')
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
  end
end
