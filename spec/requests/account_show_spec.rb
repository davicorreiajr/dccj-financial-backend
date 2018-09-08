require 'rails_helper'

RSpec.describe 'Account show', type: :request do
  let(:balance) { rand(-10.0..10.0).round(2) }
  let(:account) { create(:account, balance: balance) }
  let(:json) { JSON.parse(response.body) }

  context 'when the :id exists' do
    it 'returns the requested user' do
      get account_path(account.id), as: :json

      expect(json['balance']).to eq(balance)
    end
  end

  context 'when the :id does not exist' do
    it 'throws an error' do
      expect do
        get account_path(2), as: :json
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
