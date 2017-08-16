require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  describe '#delete_user_link' do
    context 'current user is admin' do
      let(:current_user) { build(:user, :admin) }
      let(:user) { build(:user) }
      before { assign(:current_user, current_user) }

      it 'returns a link if the user is not the current user' do
        expect(helper.delete_user_link(current_user, user)).to have_link 'delete'
      end

      it 'returns nil if the user is the current user' do
        expect(helper.delete_user_link(current_user, current_user)).to be_nil
      end
    end

    context 'current user is not an admin' do
      let(:current_user) { build(:user) }
      let(:user) { build(:user, id: 'DIFFERENT') }
      before { assign(:current_user, current_user) }

      it 'returns nil' do
        expect(helper.delete_user_link(current_user, user)).to be_nil
        expect(helper.delete_user_link(current_user, current_user)).to be_nil
      end
    end
  end

  describe '#edit_user_link' do
    context 'when arguments are nil' do
      it 'returns nil' do
        expect(helper.edit_user_link(nil, nil)).to be_nil
      end
    end

    context 'when current user is admin' do
      let(:current_user) { build(:user, :admin) }
      let(:user) { build(:user, id: 1) }
      before { assign(:current_user, current_user) }

      it 'returns a link' do
        expect(helper.edit_user_link(current_user, user)).to have_link 'Edit'
      end
    end

    context 'when current user is not an admin, but is the editable user' do
      let(:current_user) { build(:user, id: 1) }
      let(:user) { current_user }
      before { assign(:current_user, current_user) }

      it 'returns a link' do
        expect(helper.edit_user_link(current_user, user)).to have_link 'Edit'
      end
    end
  end
end
