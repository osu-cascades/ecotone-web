require 'rails_helper'

RSpec.describe "plots/show", type: :view do

  describe "displaying inoculation" do

    context "inoculated" do
      it "displays 'Yes'" do
        assign(:plot, create(:plot))
        render
        expect(rendered).to have_content("Yes")
      end
    end

    context "not inoculated" do
      it "displays 'No'" do
        assign(:plot, create(:plot, inoculated: false))
        render
        expect(rendered).to have_content("No")
      end
    end

  end

  describe "displaying latitude, longitude, area and elevation" do
    context "when present" do
      it "displays the values" do
        assign(:plot, create(:plot))
        render
        expect(rendered).to have_content("44.0582")
        expect(rendered).to have_content("121.3153")
        expect(rendered).to have_content("3623")
        expect(rendered).to have_content("100")
      end
    end

    context "when nil" do
      it "displays 'unmeasured'" do
        assign(:plot, create(:plot, latitude: nil, longitude: nil, elevation: nil, area: nil))
        render
        expect(rendered).to have_content("unmeasured")
      end
    end
  end

  context "location description" do
    it "is humanized" do
      assign(:plot, create(:plot, location_description: 'description of plot'))
      render
      expect(rendered).to have_content("Description of plot")
    end
  end

end
