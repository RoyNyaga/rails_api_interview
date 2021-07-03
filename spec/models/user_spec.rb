require 'rails_helper'

RSpec.describe User, type: :model do

  context "when validating presence" do 
    let(:user) { build(:user) }
    context "when email is blank" do 
      it "User email can't be blank" do
        user.email = nil
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank") 
      end
    end 

    context "when name is blank" do 
      it "User name can not be valid" do
        user.name = nil 
        user.valid?
        expect(user.errors.full_messages).to include("Name can't be blank")
      end
    end 

    context "when passord is blank" do 
      let(:user) { User.new()}
      it "User password can not be blank" do 
        user.password_digest = nil,
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end 
    end 
  end 

  context "when validating email uniqueness" do 
    let(:user_one) { create(:user) }
    it "user email has already been taken" do 
      user_two = build(:user, email: user_one.email)
      user_two.valid?
      expect(user_two.errors.full_messages).to include("Email has already been taken")
    end 
  end

  context "when validating email format" do 
    let(:user) { build(:user) }
    context "when email format is wrong" do 
      it "user email format is not valid" do
        invalid_email_address = [ "yest", "yest@", "yes@gmail", "2342@yahoo"]
        invalid_email_address.each do |email_address|
          user.email = email_address
          expect(user).not_to be_valid
        end 
      end 
    end 

    context "when email format is correct" do 
      it "user email format is valid" do
        valid_email_address = [ "roy@gmail.com", "12roy@yahoo.com", "we_r.1yo@gmail.com", "roy@protastudio.com"]
        valid_email_address.each do |email_address|
          user.email = email_address
          expect(user).to be_valid
        end 
      end 
    end 
  end 

  context "when validating password confirmation" do
    let(:user) { build(:user) }
    context "when passord matches password_confirmation" do 
      it "user should be valid" do 
        user.password_confirmation = user.password
        expect(user).to be_valid
      end 
    end 
    context "when password does not match password_confirmation" do 
      it "user should not be valid" do 
        user.password_confirmation = "anytypeoftext"
        expect(user).not_to be_valid
      end
    end 
  end 
end 