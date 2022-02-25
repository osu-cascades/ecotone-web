require 'rails_helper'

RSpec.describe Plot, type: :model do
  subject(:plot) { build :plot }
  let(:plant) { subject.featured_plant }

  context 'when created' do
    it { is_expected.to have_attributes(
      plot_id: 1,
      featured_plant: plant,
      latitude: 44.0582,
      longitude: 121.3153,
      elevation: 3623.0,
      area: 100,
      location_description: 'south wall of Tykeson Hall.',
      aspect: 'North',
      origin: 'Salvage',
      inoculated: true,
      initial_planting_date: 'Spring, 2017',
      initial_succession: 'Nudation',
    ) }
    it { is_expected.to be_valid }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:plot_id) }
    it { is_expected.to validate_numericality_of(:latitude).is_greater_than(0).allow_nil }
    it { is_expected.to validate_numericality_of(:longitude).is_greater_than(0).allow_nil }
    it { is_expected.to validate_numericality_of(:elevation).is_greater_than(0).allow_nil }
    it { is_expected.to validate_numericality_of(:area).is_greater_than(0).allow_nil }
    it { is_expected.to validate_presence_of(:location_description) }
    it { is_expected.to validate_presence_of(:aspect) }
    it { is_expected.to validate_presence_of(:origin) }
    it { is_expected.to validate_presence_of(:initial_planting_date) }
    it { is_expected.to validate_presence_of(:initial_succession) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:featured_plant).class_name('Plant').optional }
    it { is_expected.to have_many :biodiversity_reports }
  end

  context 'without a featured plant' do
    before {plot.featured_plant = nil}
    it 'has an unspecified featured plant name' do
      expect(plot.featured_plant_name).to eq('Unspecified')
    end
  end

  context 'with a featured plant' do
    it 'has a featured plant_name that is the common name of the plant' do
      expect(plot.featured_plant_name).to eq(plot.featured_plant.common_name)
    end
  end

  it 'has a name consisting of its user-provided plot id' do
    expect(plot.name).to eq("Plot ##{plot.plot_id}")
  end

  it 'has a string representation consisting of its name' do
    expect(plot.to_s).to eq(plot.name)
  end

  it 'formats location description' do
    expect(plot.formatted_location_description).to eq('South wall of Tykeson Hall')
  end
end
