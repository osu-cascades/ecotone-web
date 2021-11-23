require 'rails_helper'

RSpec.describe NonvascularPlantSample, type: :model do
  subject(:nvp_sample) { build :nonvascular_plant_sample }

  context 'when created' do
    it { is_expected.to have_attributes(
      collected_on: Date.today,
      location_within_plot: 'on a twig',
      description: 'description of a nonvascular plant'
    ) }
    it { is_expected.to be_valid }
  end

  describe 'validations and associations' do
    it { is_expected.to validate_presence_of(:collected_on) }
    it { is_expected.to validate_presence_of(:location_within_plot) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to belong_to(:plot) }
    it { is_expected.to belong_to(:user) }
  end

  it 'has a string representation consisting of its name' do
    expect(nvp_sample.to_s).to eq("#{nvp_sample.plot} on #{nvp_sample.collected_on} by #{nvp_sample.user}")
  end

end
