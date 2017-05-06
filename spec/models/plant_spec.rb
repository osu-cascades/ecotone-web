require 'rails_helper'

RSpec.describe Plant, type: :model do
  
  subject(:plant) { build :plant }

  context "when created" do
    it { is_expected.to have_attributes(
      common_name: "Plant Example",
      scientific_name: "Scientific Example",
      description: "Description Example",
      habitat_type: "Habitat Example",
      sunlight_tolerance: "Sunlight Example"
    ) }
    it { is_expected.to be_valid }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:common_name) }
    it { is_expected.to validate_presence_of(:scientific_name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:habitat_type) }
    it { is_expected.to validate_presence_of(:sunlight_tolerance) }
  end
end
