require 'rails_helper'

RSpec.describe FungiSample, type: :model do
  subject(:fungi_sample) { build :fungi_sample }

  context 'when created' do
    it { is_expected.to have_attributes(location_within_plot: 'on a rock',
                                        size: 1.5,
                                        description: 'description of fungi sample') }
    it { is_expected.to be_valid }
  end

  describe 'validations and associations' do
    it { is_expected.to validate_presence_of(:location_within_plot) }
    it { is_expected.to validate_numericality_of(:size).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_attachment_content_type(:photo).allowing('image/jpg', 'image/png') }
    it { is_expected.to belong_to(:biodiversity_report) }
    it { is_expected.to have_attached_file(:photo) }
  end
end
