require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  let(:user) { create(:user) }

  describe '#log_in' do
    it 'stores a user id in the session' do
      helper.log_in(user)
      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe '#current_user' do
    it 'returns a user whose id is in the session' do
      session[:user_id] = user.id
      expect(helper.current_user).to eq(user)
    end
    it 'returns nil when no user id is in the session' do
      expect(helper.current_user).to be_nil
    end
  end

  describe '#current_user?' do
    it 'returns true when the user is the current user' do
      allow(helper).to receive(:current_user) { user }
      expect(helper.current_user?(user)).to be true
    end

    it 'returns false when there is no current user' do
      expect(helper.current_user?(user)).to be false
    end

    it 'returns false when the user is not the current user' do
      allow(helper).to receive(:current_user) { user }
      expect(helper.current_user?(build(:user))).to be false
    end

    it 'returns false when both the user and current_user are nil' do
      allow(helper).to receive(:current_user) { nil }
      expect(helper.current_user?(nil)).to be false
    end
  end

  describe '#logged_in?' do
    it 'returns true when there is a current user' do
      allow(helper).to receive(:current_user) { user }
      expect(helper.logged_in?).to be true
    end

    it 'returns false when there is no current user' do
      expect(helper.logged_in?).to be false
    end
  end

  describe '#log_out' do
    before do
      helper.instance_variable_set(:@current_user, 'FAKE')
      session[:user_id] = 'FAKE'
    end

    it 'removes the user_id from the session' do
      helper.log_out
      expect(session.key? :user_id).to be false
    end

    it 'sets the current user to nil' do
      helper.log_out
      expect(helper.instance_variable_get(:@current_user)).to be_nil
    end
  end
end
