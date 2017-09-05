require 'rails_helper'

RSpec.describe Nutrient, type: :model do
  subject(:nutrient) { build :nutrient }

  context 'when created' do
    it { is_expected.to have_attributes(name: 'fake', level: 1, amount: 1.5) }
    it { is_expected.to be_valid }
  end
end
