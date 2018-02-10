require 'rails_helper'

RSpec.describe TreeSample, type: :model do
  subject(:tree_sample) { build :tree_sample }

  context 'when created' do
    it { is_expected.to have_attributes(
      collected_on: Date.today,
      tag_number: 1,
      growth_stage: 'seedling',
      dbh: 1.5,
      lower_canopy_height: 1.5,
      upper_canopy_height: 1.5,
      latitude: 1.5,
      longitude: 1.5,
    ) }
    it { is_expected.to be_valid }
  end

  describe 'validations and associations' do
    it { is_expected.to validate_presence_of(:collected_on) }
    it { is_expected.to validate_numericality_of(:tag_number).only_integer.is_greater_than(0) }
    it { is_expected.to validate_presence_of(:growth_stage) }
    it { is_expected.to validate_numericality_of(:dbh).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:lower_canopy_height).is_greater_than(0).allow_nil }
    it { is_expected.to validate_numericality_of(:upper_canopy_height).is_greater_than(0).allow_nil }
    it { is_expected.to validate_numericality_of(:latitude).allow_nil }
    it { is_expected.to validate_numericality_of(:longitude).allow_nil }
    it { is_expected.to validate_attachment_content_type(:photo).allowing('image/jpg', 'image/png') }
    it { is_expected.to have_attached_file(:photo) }
    it { is_expected.to belong_to(:plot) }
    it { is_expected.to belong_to(:plant) }
    it { is_expected.to belong_to(:user) }
  end

  it 'has a string representation consisting of its name' do
    expect(tree_sample.to_s).to eq("#{tree_sample.plant} in #{tree_sample.plot} on #{tree_sample.collected_on} by #{tree_sample.user}")
  end
end
