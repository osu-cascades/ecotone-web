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
    it { is_expected.to have_attached_file(:photo) }
    it { is_expected.to validate_attachment_content_type(:photo).allowing('image/jpg', 'image/png') }
    it { is_expected.to belong_to(:biodiversity_report) }
    it { is_expected.to belong_to(:plot) }
    it { is_expected.to belong_to(:user) }
  end

end
