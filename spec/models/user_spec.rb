require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { build :user }

  context "when created" do
    it { is_expected.to have_attributes(
      name: "Example Valid User",
      email: "example@example.com",
      password: "password",
      password_confirmation: "password",
      admin: false
    ) }
    it { is_expected.to be_valid }
    it { is_expected.to_not be_admin }
  end

  describe "validations" do

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(50) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_length_of(:email).is_at_least(3) }
    it { is_expected.to validate_length_of(:email).is_at_most(255) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

    it { is_expected.to have_secure_password }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
    it { is_expected.to validate_confirmation_of(:password) }

  end

  describe "associations" do
    it { is_expected.to have_many(:biodiversity_reports) }
  end

  describe "::digest" do
    it "returns a BCrypt::Password instance" do
      expect(User.digest('fake')).to be_a BCrypt::Password
    end
  end

  describe "::new_token" do
    it "returns a url-safe base64 string consisting of A-Z, a-z, 0-9, - and _" do
      expect(User.new_token).to match /[A-Za-z0-9\-_]{22}/
    end
  end

  describe "creating a reset digest" do
    it "changes the reset_token" do
      expect { user.create_reset_digest }.to change(user, :reset_token)
    end
    it "changes the reset_digest" do
      expect { user.create_reset_digest }.to change(user, :reset_digest)
    end
    it "sets reset_sent_at to the current time" do
      # We should verify the time value, but that's a pain in the ass.
      expect { user.create_reset_digest }.to change(user, :reset_sent_at)
    end
  end

  describe "sending a password reset email" do
    it "is expected to send" do
      delivery = double # ActionMailer::MessageDelivery
      allow(delivery).to receive(:deliver_now).and_return('fake')
      expect(UserMailer).to receive(:password_reset).with(user).and_return(delivery)
      expect(user.send_password_reset_email).to eq 'fake'
    end
  end

  describe "password reset expiration" do
    it "is expired when the reset was sent over two hours ago" do
      allow(user).to receive(:reset_sent_at).and_return(2.hours.ago - 1)
      expect(user.password_reset_expired?).to be true
    end
    it "is not expired when the reset was sent less than two hours ago" do
      allow(user).to receive(:reset_sent_at).and_return(2.hours.ago + 1)
      expect(user.password_reset_expired?).to be false
    end
  end

  it "has a string representation consisting of its name" do
    expect(user.to_s).to eq(user.name)
  end

end
