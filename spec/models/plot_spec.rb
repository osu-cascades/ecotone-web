require 'rails_helper'

RSpec.describe Plot, type: :model do
  subject(:plot) { build :plot }
  let(:plant) { subject.featured_plant }

  context "when created" do
    it { is_expected.to have_attributes(
      plot_id: 1,
      featured_plant: plant,
      latitude: 44.0582,
      longitude: 121.3153,
      elevation: 3623.0,
      area: 100,
      location_description: "South wall of Tykson Hall",
      aspect: "North",
      origin: "Salvage",
      inoculated: true,
      initial_planting_date: "Spring, 2017",
      initial_succession: "Nudation",
    ) }
    it { is_expected.to be_valid }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:plot_id) }
    it { is_expected.to validate_presence_of(:featured_plant) }
    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }
    it { is_expected.to validate_presence_of(:elevation) }
    it { is_expected.to validate_presence_of(:area) }
    it { is_expected.to validate_presence_of(:location_description) }
    it { is_expected.to validate_presence_of(:aspect) }
    it { is_expected.to validate_presence_of(:origin) }
    it { is_expected.to validate_presence_of(:initial_planting_date) }
    it { is_expected.to validate_presence_of(:initial_succession) }
  end

  context "without a featured plant" do
    before {plot.featured_plant = nil}
    it "has an unspecified featured plant name" do
      expect(plot.featured_plant_name).to eq('Unspecified')
    end

  end

  context "with a featured plant" do
    it "has a featured plant_name that is the common name of the plant" do
      expect(plot.featured_plant_name).to eq(plot.featured_plant.common_name)
    end
  end

end
