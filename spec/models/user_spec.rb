require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "Example User", email: "user@example.com", password: "password", password_confirmation: "password") }

  it "should be valid" do
    expect(user.valid?).to be_truthy
  end

  it "name should be present" do
    user.name = "  "
    expect(user.valid?).to be_falsy
  end

  it "email should be present" do
    user.email = "  "
    expect(user.valid?).to be_falsy
  end

  it "name should not be too long" do
    user.name = 'z' * 51
    expect(user.valid?).to be_falsy
  end

  it "email should not be too long" do
    user.email = "z" * 244 + "@example.com"
    expect(user.valid?).to be_falsy
  end

  it "email should not be too short" do
    user.email =  "aa"
    expect(user.valid?).to be_falsy
  end

  it "email should be a valid address" do
    valid_addresses = ["user@example.com", "USER@foo.COM", "A_US-ER@foo.bar.org", "first.last@foo.jp", "alice+bob@baz.cn"]
    valid_addresses.each do |va|
      user.email = va
      expect(user.valid?).to be_truthy
    end
  end

  it "email should reject invalid addresses" do
    invalid_addresses = ["user@example,com", "user_at_foo.org", "user.name@example.", "foo@bar_baz.com", "aoo@bar+baz.com"]
    invalid_addresses.each do |ina|
      user.email = ina
      expect(user.valid?).to be_falsy
    end
  end

  it "email should be unique" do
    duplicate_user = User.new(name: "Example User", email: user.email, password: "password", password_confirmation: "password")
    expect(duplicate_user.valid?).to be_falsy
  end

  it "password should be present" do
    user.password = "   "
    expect(user.valid?).to be_falsy
  end

  it "password should be of sufficient length" do
    user.password = 'z' * 5
    expect(user.valid?).to be_falsy
  end

end
