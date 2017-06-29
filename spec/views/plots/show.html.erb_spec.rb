require 'rails_helper'

RSpec.describe "plots/show", type: :view do

  describe "displaying inoculation" do

    context "inoculated" do
      it "displays 'Yes'" do
        assign(:plot, build(:plot))
        render
        expect(rendered).to have_content("Inoculated? Yes")
      end
    end

    context "not inoculated" do
      it "displays 'No'" do
        assign(:plot, build(:plot, inoculated: false))
        render
        expect(rendered).to have_content("Inoculated? No")
      end
    end

  end
end
