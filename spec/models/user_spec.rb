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
    it 'should throw an error when the password and confirmation don\'t match for the user creation' do
      @user = User.new(
                first_name: 'Viccy',
                last_name: 'Carver',
                email: 'viccy@viccy.com',
                password: 'xxxxxx',
                password_confirmation: 'yyyyyy')
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'should throw an error when the email address already exists for the user creation' do
      @user1 = User.new(
                first_name: 'Viccy',
                last_name: 'Carver',
                email: 'viccy@viccy.com',
                password: 'xxxxxx',
                password_confirmation: 'xxxxxx')
      @user1.save
      @user2 = User.new(
                first_name: 'Lennon',
                last_name: 'Grace',
                email: 'VICCY@VICCY.COM',
                password: 'xxxxxx',
                password_confirmation: 'xxxxxx')
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
    it 'should throw a required error when the email parameter is missing from user creation' do
      @user = User.new(
                first_name: 'Viccy',
                last_name: 'Carver',
                password: 'xxxxxx',
                password_confirmation: 'xxxxxx')
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'should throw a required error when the first_name parameter is missing from user creation' do
      @user = User.new(
                last_name: 'Carver',
                email: 'VICCY@VICCY.COM',
                password: 'xxxxxx',
                password_confirmation: 'xxxxxx')
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'should throw a required error when the first_name parameter is missing from user creation' do
      @user = User.new(
                first_name: 'Viccy',
                email: 'VICCY@VICCY.COM',
                password: 'xxxxxx',
                password_confirmation: 'xxxxxx')
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'should throw a password length error when the password is not the correct length' do
      @user = User.new(
                first_name: 'Viccy',
                last_name: 'Carver',
                email: 'VICCY@VICCY.COM',
                password: 'xxxx',
                password_confirmation: 'xxxx')
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end
end
