require 'rails_helper'

RSpec.describe Nutrient, type: :model do
  subject(:nutrient) { build :nutrient }
  let(:nutrient_without_level) { build :nutrient, :without_level }
  let(:nutrient_without_amount) { build :nutrient, :without_amount }
  let(:nutrient_without_level_or_amount) { build :nutrient, :without_level_or_amount }

  context 'when created' do
    it { is_expected.to have_attributes(name: 'fake', level: 'low', amount: 1.5) }
    it { is_expected.to be_valid }
  end

  describe 'validations and associations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to define_enum_for(:level) }
    it { is_expected.to validate_numericality_of(:amount).allow_nil.is_greater_than_or_equal_to(0) }
    it { is_expected.to belong_to(:soil_sample) }

    context 'without a level' do
      it 'validates presence of amount' do
        expect(nutrient_without_level).to validate_presence_of(:amount)
      end
    end

    context 'without an amount' do
      it 'validates presence of level' do
        expect(nutrient_without_amount).to validate_presence_of(:level)
      end
    end

    context 'without an amount or level' do
      it 'is invalid' do
        expect(nutrient_without_level_or_amount).to_not be_valid
      end
    end

  end

end
