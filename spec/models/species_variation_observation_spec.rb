require 'rails_helper'

RSpec.describe SpeciesVariationObservation, type: :model do
  subject(:species_variation_observation) { build :species_variation_observation }

  context 'when created' do
    it { is_expected.to have_attributes(
      observed_on: Date.today,
      average_height: 1.5,
      average_width: 1.5,
      description: 'Fake description'
    ) }
    it { is_expected.to be_valid }
  end

  describe 'validations and associations' do
    it { is_expected.to validate_presence_of(:observed_on) }
    it { is_expected.to validate_numericality_of(:average_height).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:average_width).is_greater_than_or_equal_to(0) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:plot) }
    it { is_expected.to belong_to(:plant) }
  end

  it 'has a string representation consisting of its name' do
    expect(species_variation_observation.to_s).to eq("#{species_variation_observation.plant} in #{species_variation_observation.plot} on #{species_variation_observation.observed_on} by #{species_variation_observation.user}")
  end
end
