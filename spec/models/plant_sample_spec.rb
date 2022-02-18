require 'rails_helper'

RSpec.describe PlantSample, type: :model do

  subject(:plant_sample) { build :plant_sample }

  context 'when created' do
    it { is_expected.to have_attributes(
      collected_on: Date.today,
      abundance: 1,
      percent_cover: 1,
      biomass_estimate: 1.0
    ) }
    it { is_expected.to be_valid }
  end

  describe 'validations and associations' do
    it { is_expected.to validate_presence_of(:collected_on) }
    it { is_expected.to validate_numericality_of(:abundance).only_integer.is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:percent_cover).only_integer.is_greater_than(0).is_less_than_or_equal_to(100) }
    it { is_expected.to validate_numericality_of(:biomass_estimate).is_greater_than_or_equal_to(0).allow_nil }

    it { is_expected.to belong_to(:plant) }
    it { is_expected.to belong_to(:plot) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_and_belong_to_many(:biodiversity_reports) }
  end

  it 'has a string representation consisting of its name' do
    expect(plant_sample.to_s).to eq("#{plant_sample.plot} on #{plant_sample.collected_on} by #{plant_sample.user}")
  end

  describe '#to_csv' do
     skip 'generates a valid csv representation' do
      p1 = PlantSample.create(plant: plant, collected_on: '2000-01-01', biodiversity_report: biodiversity_report, plot: biodiversity_report.plot, user: biodiversity_report.author, abundance: 1, percent_cover: 1)
      p2 = PlantSample.create(plant: plant, collected_on: '2000-01-01', biodiversity_report: biodiversity_report, plot: biodiversity_report.plot, user: biodiversity_report.author, abundance: 1, percent_cover: 1)

      plant_sample_attributes = %w[collected_on abundance percent_cover]
      bd_attributes = %w[measured_on measured_at temperature species_richness diversity_index]
      plant_attributes = %w[common_name scientific_name]

      expected_csv = File.read(File.dirname(__FILE__) + '/expected.csv')
      generated_csv = PlantSample.to_csv(plant_sample_attributes, bd_attributes, plant_attributes)
      expect(generated_csv).to eq(expected_csv.gsub(/\r/, ''))
    end
  end
end
