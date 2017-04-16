require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "Example User", email: "user@example.com", password: "password", password_confirmation: "password") }

  it "is valid" do
    expect(user.valid?).to be_truthy
  end

  it "is invalid without a name" do
    user.name = "  "
    expect(user.valid?).to be_falsy
  end

  it "is invalid without an email address" do
    user.email = "  "
    expect(user.valid?).to be_falsy
  end

  it "is invalid if the name is too long" do
    user.name = 'z' * 51
    expect(user.valid?).to be_falsy
  end

  it "is invalid if email address is too long" do
    user.email = "z" * 244 + "@example.com"
    expect(user.valid?).to be_falsy
  end

  it "is invalid if email address is too short" do
    user.email =  "aa"
    expect(user.valid?).to be_falsy
  end

  it "is valid given variations of valid email addresses" do
    valid_addresses = ["user@example.com", "USER@foo.COM", "A_US-ER@foo.bar.org", "first.last@foo.jp", "alice+bob@baz.cn"]
    valid_addresses.each do |va|
      user.email = va
      expect(user.valid?).to be_truthy
    end
  end

  it "is invalid if email address is invalid" do
    invalid_addresses = ["user@example,com", "user_at_foo.org", "user.name@example.", "foo@bar_baz.com", "aoo@bar+baz.com"]
    invalid_addresses.each do |ina|
      user.email = ina
      expect(user.valid?).to be_falsy
    end
  end

  it "is invalid if email address is taken" do
    duplicate_user = User.new(name: "Example User", email: user.email, password: "password", password_confirmation: "password")
    expect(duplicate_user.valid?).to be_falsy
  end

  it "is invalid without a password" do
    user.password = "   "
    expect(user.valid?).to be_falsy
  end

  it "is invalid if password is too short" do
    user.password = 'z' * 5
    expect(user.valid?).to be_falsy
  end

  it "is invalid when password does not match password confirmation" do
    user.password = "something"
    user.password_confirmation = "something else"
    expect(user.valid?).to be_falsy
  end

end
