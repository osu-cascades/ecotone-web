require 'rails_helper'

RSpec.describe BiodiversityReportsHelper, type: :helper do
  let(:soil_sample) { build(:soil_sample) }
  let(:empty_soil_sample) { build(:empty_soil_sample) }

  @template = Object.new
  @template.extend ActionView::Helpers::FormHelper
  @template.extend ActionView::Helpers::FormOptionsHelper
  let(:biodiversity_report) { build(:biodiversity_report) }
  let(:builder) { FormBuilder.new :biodiversity_report, biodiversity_report, @template, html: { multipart: true } }

  describe '#link_to_toggle_sample_fields' do
    context 'when the soil sample has attribute values' do
      skip 'returns an Omit link' do
        expect(helper.link_to_toggle_sample_fields_for(soil_sample)).to match '<a.*>Omit soil sample</a>'
      end
    end

    context 'when the soil sample does not have attribute values' do
      skip 'returns an Add link' do
        expect(helper.link_to_toggle_sample_fields_for(empty_soil_sample)).to match '<a.*>Add soil sample</a>'
      end
    end

    context 'when the soil sample is nil' do
      skip 'returns nil' do
        expect(helper.link_to_toggle_sample_fields_for(nil)).to be_nil
      end
    end
  end

  describe '#visibility_class' do
    context 'when the soil sample has attribute values' do
      skip "returns 'in'" do
        expect(visibility_class(soil_sample)).to eq('in')
      end
    end

    context 'when the soil sample does not have attribute values' do
      skip 'returns false' do
        expect(visibility_class(empty_soil_sample)).to be(false)
      end
    end
  end

  # link_to_add_fields 'Add plant sample', form, :plant_samples
  describe '#link_to_add_fields' do
    skip 'extract builder object' do
      subject(:link) { link_to_add_fields('Fake', builder, :soil_sample) }
      it { is_expected.to match(/<a href='#' class='add_fields' data-id='.*' data-fields='.*'>Fake<\/a>/) }
    end
  end
end
