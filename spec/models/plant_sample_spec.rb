require 'rails_helper'

RSpec.describe PlantSample, type: :model do
  let(:plant) { build :plant }
  let(:biodiversity_report) { build :biodiversity_report, measured_on: '2000-01-01', measured_at: '2000-01-01 00:00:00 UTC' }
  subject(:plant_sample) { build :plant_sample, plant: plant, biodiversity_report: biodiversity_report }

  context 'when created' do
    it { is_expected.to have_attributes(
      collected_on: Date.today,
      abundance: 1,
      percent_cover: 1
    ) }
    it { is_expected.to be_valid }
  end

  describe 'validations and associations' do
    it { is_expected.to validate_presence_of(:collected_on) }
    it { is_expected.to validate_numericality_of(:abundance).only_integer.is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:percent_cover).only_integer.is_greater_than(0).is_less_than_or_equal_to(100) }
    it { is_expected.to have_attached_file(:photo) }
    it { is_expected.to validate_attachment_content_type(:photo).allowing('image/jpg', 'image/png') }
    it { is_expected.to belong_to(:plant) }
    it { is_expected.to belong_to(:biodiversity_report) }
    it { is_expected.to belong_to(:plot) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_and_belong_to_many(:biodiversity_reports) }
  end

  describe '#to_csv' do
    it 'generates a valid csv representation' do
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
