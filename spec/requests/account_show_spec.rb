# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Account show', type: :request do
  let(:balance) { rand(-10.0..10.0).round(2) }
  let(:account) { create(:account, balance: balance) }
  let(:user) { create(:user, account: account) }
  let(:json) { JSON.parse(response.body) }

  before do
    sign_in user
  end

  context 'when the :id exists' do
    it 'returns the requested user' do
      get account_path(account.id), as: :json

      expect(json['balance']).to eq(balance)
    end
  end

  context 'when the :id does not exist' do
    let(:nonexistent_id) { (Account.last&.id || 0) + 1 }

    it 'throws an error' do
      expect do
        get account_path(nonexistent_id), as: :json
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
