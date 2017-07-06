require 'rails_helper'

RSpec.describe Plant, type: :model do

  subject(:plant) { build :plant }

  context "when created" do
    it { is_expected.to have_attributes(
      common_name: "Plant Example",
      scientific_name: "Scientific Example",
      description: "Description Example",
      habitat_type: "Habitat Example",
      tolerance: "Tolerance Example"
    ) }
    it { is_expected.to be_valid }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:common_name) }
    it { is_expected.to validate_presence_of(:scientific_name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:habitat_type) }
    it { is_expected.to validate_presence_of(:tolerance) }
    it { is_expected.to validate_attachment_content_type(:photo).allowing('image/jpg', 'image/png') }
  end

  describe "associations" do
    it { is_expected.to have_attached_file(:photo) }
    it { is_expected.to have_many(:plots).with_foreign_key(:featured_plant_id) }
    it { is_expected.to have_many(:plant_samples) }
  end
end
