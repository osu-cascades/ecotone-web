require 'rails_helper'

RSpec.describe PlotsHelper, type: :helper do
  describe '#link_to_featured_plant' do
    let(:plot) { create(:plot, id: 1) }
    let(:current_user) { build(:user, :admin) }

    context 'plot has no featured plant and admin is logged in' do
      before { plot.featured_plant = nil }
      before { allow(helper).to receive(:current_user).and_return(current_user) }
      it "returns 'Unassigned' with a link to edit the plot" do
        expect(helper.link_to_featured_plant(plot)).to match "Unassigned. <a title=\"Edit Plot #1\" href=\"/plots/1/edit\">Add one?</a>"
      end
    end

    context 'plot has no featured plant and admin is not logged in' do
      before { plot.featured_plant = nil }
      it "returns 'n/a'" do
        expect(helper.link_to_featured_plant(plot)).to match 'n/a'
      end
    end

    context 'plot has a featured plant' do
      it 'returns a link to the featured plant' do
        expect(helper.link_to_featured_plant(plot)).to match "<a title=\"Details of .*\" href=\"/plants/.*\">Plant Example</a>"
      end
    end
  end
end
