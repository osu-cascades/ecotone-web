require 'rails_helper'

RSpec.describe BiodiversityReportsController, type: :controller do
  let(:admin_user) { build(:user, :admin) }
  let(:biodiversity_report) { create(:biodiversity_report) }

  before do
    allow(controller).to receive(:current_user).and_return(admin_user)
    allow(controller).to receive(:user_signed_in?).and_return(true)
  end

  describe '#destroy' do
    before do
      @biodiversity_report = create(:biodiversity_report)
    end

    it 'deletes biodiversity report' do
      expect { delete :destroy, params: { id: @biodiversity_report } }.to change(BiodiversityReport, :count).by(-1)
    end

    it 'redirects to index' do
      delete :destroy, params: { id: @biodiversity_report }
      expect(response).to redirect_to biodiversity_reports_url
    end

    it 'produces correct flash notice' do
      delete :destroy, params: { id: @biodiversity_report }
      assert_equal 'Biodiversity report was successfully deleted.', flash[:success]
    end
  end
end
