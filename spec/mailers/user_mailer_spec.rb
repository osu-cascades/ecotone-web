require "rails_helper"

RSpec.describe UserMailer, type: :mailer do

  describe "password_reset" do

    let(:user) { build(:user, :resetting_password) }
    subject(:mail) do
      UserMailer.password_reset(user)
    end

    it "renders the headers" do
      expect(mail.subject).to eq("Ecotone Password Reset")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["no-reply@ecotone.osucascades.edu"])
    end

    it "renders the body" do
      password_reset_url = /http.*:\/\/.*\/password_resets\/#{user.reset_token}\/edit\?email=#{CGI.escape user.email}/
      expect(mail.body.encoded).to match(password_reset_url)
      expect(mail.body.encoded).to have_link("Reset password", href: password_reset_url)
    end

  end

end
