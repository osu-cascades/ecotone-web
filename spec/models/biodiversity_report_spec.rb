require 'rails_helper'

RSpec.describe BiodiversityReport, type: :model do
   subject(:report) { build :biodiversity_report, id: 'FAKE' }

  context 'when created' do
    it { is_expected.to have_attributes(
      measured_on: Date.today,
      temperature: 1.5,
      species_richness: 1,
      diversity_index: 1.5,
      species_evenness: 0.5,
      biomass_estimate: 1.0
    ) }
    it { is_expected.to be_valid }

    it 'has a string representation incorporating its id' do
      expect(report.to_s).to eq("Biodiversity Report #{report.id}")
    end

  end

  describe 'validations' do
    it { is_expected.to validate_numericality_of(:temperature).allow_nil }
    it { is_expected.to validate_numericality_of(:species_richness).only_integer.is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:diversity_index).is_greater_than(0) }
    it { is_expected.to validate_numericality_of(:species_evenness).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(1) }
    it { is_expected.to validate_numericality_of(:biomass_estimate).is_greater_than_or_equal_to(0).allow_nil }
    it { is_expected.to validate_presence_of(:measured_on) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:author).class_name('User') }
    it { is_expected.to belong_to(:plot) }
    it { is_expected.to have_and_belong_to_many(:soil_samples) }
    it { is_expected.to have_and_belong_to_many(:lichen_samples) }
    it { is_expected.to have_and_belong_to_many(:macroinvertebrate_samples) }
    it { is_expected.to have_and_belong_to_many(:plant_samples) }
  end

  describe 'editability' do
    let(:author) { report.author }
    let(:admin) { build(:user, :admin) }

    it 'is editable by its author, who is not an admin' do
      expect(report).to be_editable_by(author)
    end

    it 'is editable by an admin, who is not the author' do
      expect(report).to be_editable_by(admin)
    end

    it 'is not editable by anyone else' do
      expect(report).to_not be_editable_by(build(:user))
    end
  end
end
