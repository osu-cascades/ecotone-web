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

    it 'generates a valid csv representation' do

      skip 'TODO: add a plant sample to expected.csv and figure out how to test #to_csv on actual
                  plant sample objects. Current implementation only tests the csv header row'

      plant_sample_attributes = %w(abundance percent_cover)
      bd_attributes = %w(measured_on measured_at temperature species_richness diversity_index)
      plant_attributes = %w(common_name scientific_name)

      expected_csv = File.read(File.dirname(__FILE__) + '/expected.csv')
      generated_csv = PlantSample.all.to_csv(plant_sample_attributes, bd_attributes, plant_attributes)

      expect(generated_csv).to eq(expected_csv.gsub(/\r/, ''))
    end
  end

  describe 'AttributePresence::visibilty_class' do
    let(:plant_sample) { build(:plant_sample) }
    let(:empty_plant_sample) { build(:empty_plant_sample) }

    context "when the plant sample has attribute values" do
      it "returns 'in'" do
        expect(plant_sample.visibility_class).to eq('in')
      end
    end
    context "when the plant sample does not have attribute values" do
      it "returns false" do
        expect(empty_plant_sample.visibility_class).to be(false)
      end
    end
  end

end
