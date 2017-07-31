require 'rails_helper'

RSpec.describe PlantSample, type: :model do

  let(:plant) { build :plant }
  let(:biodiversity_report) { build :biodiversity_report }
  subject(:plant_sample) { build :plant_sample, plant: plant, biodiversity_report: biodiversity_report }

  context 'when created' do
    it { is_expected.to have_attributes(abundance: 1, percent_cover: 1) }
    it { is_expected.to be_valid }
  end

  describe 'validations and associations' do
    it { is_expected.to validate_numericality_of(:abundance).only_integer.is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:percent_cover).only_integer.is_greater_than(0).is_less_than_or_equal_to(100) }
    it { is_expected.to have_attached_file(:photo) }
    it { is_expected.to validate_attachment_content_type(:photo).allowing('image/jpg', 'image/png') }
    it { is_expected.to belong_to(:plant) }
    it { is_expected.to belong_to(:biodiversity_report) }
  end

  describe '#to_csv' do

    skip 'TODO: create proper .csv file, check generated_csv and csv_file are equivalent'

    it 'generates a valid csv representation' do

      plant_sample_attributes = %w(abundance percent_cover)
      bd_attributes = %w(measured_on measured_at temperature species_richness diversity_index)
      plant_attributes = %w(common_name scientific_name)

      generated_csv = PlantSample.to_csv(plant_sample_attributes, bd_attributes, plant_attributes)
    end
  end

end
