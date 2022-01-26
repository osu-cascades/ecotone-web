require 'rails_helper'

RSpec.describe "layouts/application", type: :view do

  subject(:layout) { render }

  it { is_expected.to have_title "Ecotone | OSU-Cascades" }
  it { is_expected.to have_content "Ecotone" }
  it { is_expected.to have_link "Report a Bug" }
  it { is_expected.to have_link "OSU Cascades" }
  it { is_expected.to have_link "Map" }

  context "not logged in" do
    it { is_expected.to have_link "Log in" }
  end

  context "logged in as regular user" do

    let(:user) { build(:user) }
    before do
      allow(view).to receive(:current_user) { user }
      allow(view).to receive(:user_signed_in?) { true }
    end

    it { is_expected.to_not have_link "Log in" }
    it { is_expected.to have_link user.name }
    it { is_expected.to have_link "Log out" }
    it { is_expected.to have_link "My Profile" }

  end

  context "logged in as admin" do

    let(:user) { build(:user, :admin) }
    before do
      allow(view).to receive(:current_user) { user }
      allow(view).to receive(:user_signed_in?) { true }
    end

    it { is_expected.to have_link "Users" }

  end

end
