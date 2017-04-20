require 'rails_helper'

RSpec.describe "page content" do

  describe "home page" do

    before { visit root_path }

    it "has appropriate title" do
      expect(page).to have_title "Ecotone | OSU Cascades"
    end

    it "has sign up link" do
      expect(page).to have_link("Sign up!")
    end

    it "has appropriate header content" do
      expect(page).to have_content("Ecotone")
    end

    it "has link to bug reporter" do
      expect(page).to have_link("Report a Bug")
    end

  end

end
