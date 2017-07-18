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

  describe "#has_temperature_or_ph_level?" do

    it "returns false when all attributes are nil" do
      soil_sample.ph_level = nil
      soil_sample.temperature = nil
      soil_sample.moisture = nil
      soil_sample.biodiversity_report_id = nil
      expect(soil_sample.has_temperature_or_ph_level?).to be(false)
    end

    it "returns true when one or more attributes are present" do
      soil_sample.temperature = nil
      soil_sample.biodiversity_report_id = nil
      expect(soil_sample.has_temperature_or_ph_level?).to be(true)
    end

  end

end
