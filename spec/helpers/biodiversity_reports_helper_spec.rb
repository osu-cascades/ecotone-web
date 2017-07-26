require 'rails_helper'

RSpec.describe BiodiversityReportsHelper, type: :helper do

  let(:soil_sample) { build(:soil_sample) }
  let(:empty_soil_sample) { build(:empty_soil_sample) }

  describe "#link_to_toggle_sample_fields" do
    context "when the soil sample has attribute values" do
      it "returns an Omit link" do
        expect(helper.link_to_toggle_sample_fields_for(soil_sample)).to match "<a.*>Omit soil sample</a>"
      end
    end
    context "when the soil sample does not have attribute values" do
      it "returns an Add link" do
        expect(helper.link_to_toggle_sample_fields_for(empty_soil_sample)).to match "<a.*>Add soil sample</a>"
      end
    end
    context "when the soil sample is nil" do
      it "returns nil" do
        expect(helper.link_to_toggle_sample_fields_for(nil)).to be_nil
      end
    end
  end

  describe "#show_css_class" do
    context "when the soil sample has attribute values" do
      it "returns 'in'" do
        expect(helper.show_css_class(soil_sample)).to eq('in')
      end
    end
    context "when the soil sample does not have attribute values" do
      it "returns false" do
        expect(helper.show_css_class(empty_soil_sample)).to be(false)
      end
    end
    context "when the soil sample is nil" do
      it "returns nil" do
        expect(helper.show_css_class(nil)).to be_nil
      end
    end
  end

  # link_to_add_fields 'Add plant sample', form, :plant_samples
  describe "#link_to_add_fields" do
    pending
    # subject(:link) { link_to_add_fields('Fake', "TODO: BiodiversityReport form builder object", :soil_sample) }
    # it { is_expected.to match /<a href="#" class="add_fields" data-id=".*" data-fields=".*">Fake<\/a>/ }
  end

end
