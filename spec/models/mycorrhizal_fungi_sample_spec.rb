require 'rails_helper'

RSpec.describe MycorrhizalFungiSample, type: :model do

  subject(:mf_sample) { build :mycorrhizal_fungi_sample }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:collected_on).with_message("Collection Date can't be blank") }
    it { is_expected.to validate_numericality_of(:length).only_integer.is_greater_than(0) }
    it { is_expected.to validate_inclusion_of(:magnification).in_array([4, 10, 40]) }
    it { is_expected.to validate_numericality_of(:vesicle_count).only_integer.is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:arbuscule_count).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:plot) }
    it { is_expected.to belong_to(:plant) }
  end

  context 'when created with visible hyphae' do
    it { is_expected.to have_attributes(
      collected_on: Date.today,
      length: 1,
      magnification: 4,
      vesicle_count: 100,
      arbuscule_count: 0,
      visible_hyphae: true,
      hyphae_coverage: 10,
    ) }
    it { is_expected.to be_valid }
    it { is_expected.to validate_numericality_of(:hyphae_coverage).only_integer.is_greater_than(0).is_less_than_or_equal_to(100) }
  end

  context 'without visible hyphae' do
    subject(:mf_sample) { build(:mycorrhizal_fungi_sample, :without_visible_hyphae) }
    it { is_expected.to have_attributes(
      visible_hyphae: false,
      hyphae_coverage: nil,
    ) }
    it { is_expected.to be_valid }
    it { is_expected.to_not validate_numericality_of(:hyphae_coverage) }
  end

  it 'has a string representation consisting of its name' do
    expect(mf_sample.to_s).to eq("#{mf_sample.plot}, #{mf_sample.plant}, on #{mf_sample.collected_on} by #{mf_sample.user}")
  end

  describe '#has_visible_hyphae?' do
    it 'returns visible_hyphae' do
      mf_sample.visible_hyphae = false
      expect(mf_sample.has_visible_hyphae?).to eq(false)
      mf_sample.visible_hyphae = true
      expect(mf_sample.has_visible_hyphae?).to eq(true)
    end
  end

end
