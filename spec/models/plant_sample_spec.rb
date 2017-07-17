require 'rails_helper'

RSpec.describe PlantSample, type: :model do

  subject(:plant_sample) { build :plant_sample }

  context "when created" do
    it { is_expected.to have_attributes(abundance: 1, percent_cover: 1) }
    it { is_expected.to be_valid }
  end

  describe "validations and associations" do
    it { is_expected.to validate_numericality_of(:abundance).only_integer.is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:percent_cover).only_integer.is_greater_than(0).is_less_than_or_equal_to(100) }
    it { is_expected.to have_attached_file(:photo) }
    it { is_expected.to validate_attachment_content_type(:photo).allowing('image/jpg', 'image/png') }
    it { is_expected.to belong_to(:plant) }
    it { is_expected.to belong_to(:biodiversity_report) }
  end

end
