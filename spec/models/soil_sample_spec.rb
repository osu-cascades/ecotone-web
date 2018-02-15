require 'rails_helper'

RSpec.describe SoilSample, type: :model do
  subject(:soil_sample) { build :soil_sample }

  context 'when created' do
    it { is_expected.to have_attributes(
      collected_on: Date.today,
      ph_level: 1.5,
      temperature: 20.5,
      moisture: 3.5,
      collection_method: 'composite'
    ) }
    it { is_expected.to be_valid }
  end

  describe 'validations and associations' do
    it { is_expected.to validate_presence_of(:collected_on) }
    it { is_expected.to validate_numericality_of(:ph_level).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(14) }
    it { is_expected.to validate_numericality_of(:temperature) }
    it { is_expected.to validate_numericality_of(:moisture).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_presence_of(:collection_method) }
    it { is_expected.to belong_to(:plot) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:biodiversity_report) }
    it { is_expected.to have_many(:nutrients) }
  end

  describe '#build_default_nutrients' do
    before { soil_sample.build_default_nutrients }
    it 'associates three nutrients' do
      expect(soil_sample.nutrients.length).to equal(3)
    end
    it 'uses Nitrogen, Phosphorus and Potassium for the nutrient names' do
      expect(soil_sample.nutrients.collect(&:name) - SoilSample::DEFAULT_NUTRIENT_NAMES).to be_empty
    end
  end

end
