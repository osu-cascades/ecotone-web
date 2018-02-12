require 'rails_helper'

RSpec.describe MacroinvertebrateSample, type: :model do
  subject(:macroinvertebrate_sample) { build :macroinvertebrate_sample }

  context 'when created' do
    it { is_expected.to have_attributes(
      collected_on: Date.today,
      phylum: 'Arthropoda',
      location_within_plot: 'on a rock',
      quantity: 1,
      ecosystem_service: 'Pollinator'
    ) }
    it { is_expected.to be_valid }
  end

  describe 'validations and associations' do
    it { is_expected.to validate_presence_of(:collected_on) }
    it { is_expected.to validate_presence_of(:phylum) }
    it { is_expected.to validate_presence_of(:location_within_plot) }
    it { is_expected.to validate_numericality_of(:quantity).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_presence_of(:ecosystem_service) }
    it { is_expected.to validate_inclusion_of(:ecosystem_service).in_array(%w[Pollinator Consumer Decomposer]) }
    it { is_expected.to validate_attachment_content_type(:photo).allowing('image/jpg', 'image/png') }
    it { is_expected.to have_attached_file(:photo) }
    it { is_expected.to belong_to(:biodiversity_report) }
    it { is_expected.to belong_to(:plot) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_and_belong_to_many(:biodiversity_reports) }
  end
end
