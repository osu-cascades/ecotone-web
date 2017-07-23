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

  describe "displaying latitude, longitude, area and elevation" do
    context "when present" do
      it "displays the values" do
        assign(:plot, build(:plot))
        render
        expect(rendered).to have_content("Latitude: 44.0582")
        expect(rendered).to have_content("Longitude: 121.3153")
        expect(rendered).to have_content("Elevation: 3623")
        expect(rendered).to have_content("Area: 100")
      end
    end

    context "when nil" do
      it "displays 'unmeasured'" do
        assign(:plot, build(:plot, latitude: nil, longitude: nil, elevation: nil, area: nil))
        render
        expect(rendered).to have_content("Latitude: unmeasured")
        expect(rendered).to have_content("Longitude: unmeasured")
        expect(rendered).to have_content("Elevation: unmeasured")
        expect(rendered).to have_content("Area: unmeasured")
      end
    end
  end

  context "location description" do
    it "is humanized" do
      assign(:plot, build(:plot, location_description: 'description of plot'))
      render
      expect(rendered).to have_content("Description: Description of plot.")
    end
  end

end
