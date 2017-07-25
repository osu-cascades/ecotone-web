require 'rails_helper'

RSpec.describe SoilSample, type: :model do

  subject(:soil_sample) { build :soil_sample }

  context "when created" do
    it { is_expected.to have_attributes(ph_level: 1.5, temperature: 20.5, moisture: 3.5) }
    it { is_expected.to be_valid }
  end

  describe "validations and associations" do
    it { is_expected.to validate_numericality_of(:ph_level).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(14) }
    it { is_expected.to validate_numericality_of(:temperature) }
    it { is_expected.to validate_numericality_of(:moisture).is_greater_than_or_equal_to(0) }
    it { is_expected.to belong_to(:biodiversity_report) }
  end

end
