require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(:name => "Kevin Kim", :email => "ex@example.com", :password => "password", :password_confirmation => "password")
  end

  describe 'Validations' do
    it 'should create a user successfully with all fields valid.' do
      @user.save
      expect(@user).to be_valid
      expect(@user.errors.full_messages).to be_empty
    end

    it 'should output error if name is not entered' do
      @user.name = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eq(["Name can't be blank"])
    end

    it 'should output error if email is not provided' do
      @user.email = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eq(["Email can't be blank"])
    end

    it 'should output error if password is not provided' do
      @user.password = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eq(["Password can't be blank"])
    end

    it 'should output error if password_confirmation is not provided' do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eq(["Password confirmation can't be blank"])
    end

    it 'should output error if password does not match with the confirmation' do
      @user.password_confirmation = "wrongPassword"
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should output errors if the same email exist but with the use of capital letters' do
      @user.save
      @user2 = User.new(:name => "Kevin Kim", :email => "Ex@example.CoM", :password => "password", :password_confirmation => "password")
      @user2.save

      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
  end

  describe 'Password Length' do
    it 'should have minimum length of 6 for the password' do
      @user.password = "wrong"
      @user.password_confirmation = "wrong"

      @user.save

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should successfully log the user in if credentials match' do
      @user.save
      authenticated_user = User.authenticate_with_credentials('ex@example.com', 'password')
      expect(authenticated_user.email).to eq @user.email
    end

    it 'should successfully log the user in even if capital letters exist in the email' do
      @user.save
      authenticated_user = User.authenticate_with_credentials('ex@Example.cOM', 'password')
      expect(authenticated_user.email).to eq @user.email
    end

    it 'should successfully log the user in even if there is spaces at index 0 and the last index' do
      @user.save
      authenticated_user = User.authenticate_with_credentials(' ex@Example.cOM ', 'password')
      expect(authenticated_user.email).to eq @user.email
    end

    it 'should return nil if there is no email matching in the database' do
      @user.save
      authenticated_user = User.authenticate_with_credentials('wrong@example.com', 'password')
      expect(authenticated_user).to be nil
    end

    it 'should return nil if there is password does not match' do
      @user.save
      authenticated_user = User.authenticate_with_credentials('ex@example.com', 'helloworld')
      expect(authenticated_user).to be nil
    end

  end
end
