require 'rails_helper'

RSpec.describe LichenSample, type: :model do
  subject(:lichen_sample) { build :lichen_sample }

  context 'when created' do
    it { is_expected.to have_attributes(
      collected_on: Date.today,
      location_within_plot: 'on a twig',
      description: 'description of a lichen'
    ) }
    it { is_expected.to be_valid }
  end

  describe 'validations and associations' do
    it { is_expected.to validate_presence_of(:collected_on) }
    it { is_expected.to validate_presence_of(:location_within_plot) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to belong_to(:plot) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_and_belong_to_many(:biodiversity_reports) }
  end

  it 'has a string representation consisting of its name' do
    expect(lichen_sample.to_s).to eq("#{lichen_sample.plot} on #{lichen_sample.collected_on} by #{lichen_sample.user}")
  end

end
