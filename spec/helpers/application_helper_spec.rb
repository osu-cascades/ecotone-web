require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#full_title' do
    it 'returns the base title without arguments' do
      expect(helper.full_title).to eq('Ecotone | OSU-Cascades')
    end

    it 'returns a full title' do
      expect(helper.full_title('TEST')).to eq('TEST | Ecotone | OSU-Cascades')
    end
  end

  describe '#form_errors_for' do
    let(:model) { double(:photo => double(:attached? => true, :purge => true)) }

    context 'when there are no form errors' do
      it 'returns an empty string when the model has no errors' do
        allow(model).to receive(:errors).and_return([])
        expect(helper.form_errors_for(model)).to eq('')
      end
    end

    context 'when there are form errors' do
      let(:errors) { double }

      before do
        allow(errors).to receive(:full_messages).and_return(['Fake error message 1', 'Fake error message 2'])
        allow(errors).to receive(:any?).and_return(true)
        allow(errors).to receive(:count).and_return(2)
        allow(model).to receive(:errors).and_return(errors)
      end

      it 'renders a partial containing the number of errors' do
        expect(helper.form_errors_for(model)).to match('The form contains 2 errors')
      end

      it 'renders a partial containing validation errors when they exist' do
        expect(helper.form_errors_for(model)).to match('error')
        expect(helper.form_errors_for(model)).to include('Fake error message 1', 'Fake error message 2')
      end
    end
  end

  describe '#content_for_title' do
    before { helper.content_for_title('Fake') }
    it 'uses the title for the page title tag' do
      expect(view.content_for(:title)).to include('Fake')
    end
    it 'uses the title for the screen_title' do
      expect(view.content_for(:screen_title)).to include('Fake')
    end
  end

end
