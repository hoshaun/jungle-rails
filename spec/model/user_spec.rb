require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should validate' do
      @user = User.new(
        first_name: "First",
        last_name: "Last",
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_valid
    end

    it 'should not validate if passwords mismatch' do
      @user = User.new(
        first_name: "First",
        last_name: "Last",
        email: 'test@test.com',
        password: 'password',
        password_confirmation: ''
      )
      expect(@user).to be_invalid
    end

    it 'should not validate if password does not have minimum length' do
      @user = User.new(
        first_name: "First",
        last_name: "Last",
        email: 'test@test.com',
        password: 'pass',
        password_confirmation: 'pass'
      )
      expect(@user).to be_invalid
    end

    it 'should not validate if first name is nil' do
      @user = User.new(
        first_name: nil,
        last_name: "Last",
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_invalid
    end

    it 'should not validate if last name is nil' do
      @user = User.new(
        first_name: "First",
        last_name: nil,
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_invalid
    end

    it 'should not validate if email is nil' do
      @user = User.new(
        first_name: "First",
        last_name: "Last",
        email: nil,
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_invalid
    end

    it 'should not validate if email already exists' do
      @user1 = User.new(
        first_name: "First",
        last_name: "Last",
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @user1.save
      @user2 = User.new(
        first_name: "First",
        last_name: "Last",
        email: 'TEST@TEST.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(@user2).to be_invalid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return a user if it exists' do
      @user = User.new(
        first_name: "First",
        last_name: "Last",
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @user.save
      user = User.authenticate_with_credentials('test@test.com', 'password')
      expect(user).to be_present
    end

    it 'should return nil' do
      user = User.authenticate_with_credentials('test@test.com', 'password')
      expect(user).to be_nil
    end

    it 'should return a user when email has leading and trailing spaces' do
      @user = User.new(
        first_name: "First",
        last_name: "Last",
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @user.save
      user = User.authenticate_with_credentials(' test@test.com ', 'password')
      expect(user).to be_present
    end

    it 'should return a user when email is not case sensitive' do
      @user = User.new(
        first_name: "First",
        last_name: "Last",
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      @user.save
      user = User.authenticate_with_credentials('tEst@TeSt.com', 'password')
      expect(user).to be_present
    end
  end
end