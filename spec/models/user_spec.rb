require 'spec_helper'

describe User do

  it "should have a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end

  describe "timestamps" do

    let(:user) { FactoryGirl.create(:user) }

    it "should have a updated_at attribute" do
      user.should respond_to(:updated_at)
      user.updated_at.should be_a_kind_of Time
    end

    it "should have a created_at attribute" do
      user.should respond_to(:created_at)
      user.created_at.should be_a_kind_of Time
    end

  end

  describe "email address" do

    it "should require an email address" do
      FactoryGirl.build(:user, email: "").should_not be_valid
    end

    it "should accept valid email addresses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
        FactoryGirl.build(:user, email: address).should be_valid
      end
    end

    it "should reject invalid email addresses" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
        FactoryGirl.build(:user, email: address).should_not be_valid
      end
    end

    it "should reject duplicate email addresses" do
      FactoryGirl.create(:user)
      FactoryGirl.build(:user).should_not be_valid
    end

    it "should reject email addresses identical up to case" do
      upcased_email = FactoryGirl.attributes_for(:user)[:email].upcase
      FactoryGirl.create(:user, email: upcased_email)
      FactoryGirl.build(:user).should_not be_valid
    end

  end

  describe "passwords" do

    let(:user) { FactoryGirl.build(:user) }

    it "should have a password attribute" do
      user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      user.should respond_to(:password_confirmation)
    end

  end

  describe "password validations" do

    it "should require a password" do
      user = FactoryGirl.build(:user, password: "", password_confirmation: "")
      user.should_not be_valid
    end

    it "should require a matching password confirmation" do
      user = FactoryGirl.build(:user, password_confirmation: "invalid")
      user.should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      user = FactoryGirl.build(:user, password: short,
                                      password_confirmation: short)
      user.should_not be_valid
    end

  end

  describe "password encryption" do

    let(:user) { FactoryGirl.create(:user) }

    it "should have an encrypted password attribute" do
      user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      user.encrypted_password.should_not be_blank
    end

  end

end