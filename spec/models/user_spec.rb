require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    it 'a correct user is valid' do
      @user = User.new(
      first_name: "abc",
      last_name: "cde",
      email: "5@5.com",
      password: "ablaksdjf"
      )
      @user.valid?
      expect(@user.errors.size).to eql(0)
    end
    describe 'Validations' do
      it 'should give an error if password or password_confirmation is missing' do
        @user = User.new()
        @user.password_confirmation = "aldkfjalsdjkfl"
        @user.valid?
        expect(@user.errors[:password]).to include("can't be blank")
      end
      it 'should give an error if passwords and password_confirmation don\'t match' do
        @user = User.new()
        @user.password ="abc"
        @user.password_confirmation = "bcd"
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it 'should give an error if an email is used' do
        @user = User.create!(
          first_name: "abc",
          last_name: "cde",
          email: "abc@abc.com",
          password: "ablaksdjf")
        @user2 = User.new()
        @user2.email = "ABC@ABC.com"
        @user2.valid?
        expect(@user2.errors[:email]).to include("has already been taken")
      end

      it 'should give an error if Email, first name, last name is missing' do
        @user = User.new()
        @user.valid?
        expect(@user.errors[:first_name]).to include("can't be blank")
        expect(@user.errors[:last_name]).to include("can't be blank")
        expect(@user.errors[:email]).to include("can't be blank")
      end

      it 'should give an error if password is too short' do
        @user = User.new()
        @user.password = "123"
        @user.valid?
        expect(@user.errors[:password]).to include("is too short (minimum is 4 characters)")
      end
    end

    describe '.authenticate_with_credentials' do

      before do
        @user = User.create!(
          first_name: "abc",
          last_name: "cde",
          email: "abc@abc.com",
          password: "1234")
      end

      ## should check if returns object of user class
      it 'should login if login exists' do
        expect(User.authenticate_with_credentials("abc@abc.com","1234")).to be_truthy
      end
      it 'should login if user puts spaces in password or email' do
        expect(User.authenticate_with_credentials("abc@abc.com "," 1234")).to be_truthy
      end
      it 'should login if user uses different cases for email' do
        expect(User.authenticate_with_credentials("abC@aBc.com "," 1234")).to be_truthy
      end

      ### failing cases

    end
  end
end
