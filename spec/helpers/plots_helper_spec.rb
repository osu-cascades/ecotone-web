require 'rails_helper'

RSpec.describe PlotsHelper, type: :helper do

  describe "#link_to_featured_plant" do

    let(:plot) { build(:plot, id: 1) }

    context "plot has no featured plant" do
      before { plot.featured_plant = nil }
      it "returns 'Unassigned' with a link to edit the plot" do
        expect(helper.link_to_featured_plant(plot)).to match "Unassigned. <a href=\"/plots/1/edit\">Add one?</a>"
      end
    end

    context "plot has a featured plant" do
      it "returns a link to the featured plant" do
        expect(helper.link_to_featured_plant(plot)).to match "<a href=\"/plants/.*\">Plant Example</a>"
      end
    end

  end

end
