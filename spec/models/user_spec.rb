require 'rails_helper'

describe "User Model" do
    describe 'Username Validations', type: :model do

        it "User is valid" do
            user = User.new(username: "JaneDoe", password: "test")
            expect(user).to be_valid
        end

        it "A username is required" do
            user = User.new(password: "test")
            expect(user).to be_invalid
        end

        it "A username must be at least 3 characters" do
            user = User.new(username: "JD", password: "test")
            expect(user).to be_invalid
        end

        it "A username must be unique" do
            User.create(username: "JaneDoe", password: "test")
            user = User.new(username: "JaneDoe", password: "test")
            expect(user).to be_invalid
        end
        
    end

    describe 'Password Validations', type: :model do

        it "Password is valid" do
            user = User.new(username: "JaneDoe", password: "test")
            expect(user).to be_valid
        end

        it "A password is required" do
            user = User.new(username: "JaneDoe")
            expect(user).to be_invalid
        end

        it "A password must be at least 3 characters" do
            user = User.new(username: "JaneDoe", password: "5")
            expect(user).to be_invalid
        end
        
    end

    describe "New User Form", type: :model do

        it "Has a username field" do
            expect(User.new).to respond_to(:username)
        end

        it "Has a password field" do
            expect(User.new).to respond_to(:password)
        end

        it "Has a password_confirmation field" do
            expect(User.new).to respond_to(:password_confirmation)
        end

    end
end