# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Transaction destroy', type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:user) { create(:user, :with_account) }
  let(:account) { user.account }
  let!(:transactions) { create_list(:transaction, 3, account: account) }

  before do
    sign_in user
  end

  context 'when transaction id exists and belongs to the logged user' do
    it 'returns a :no_content status' do
      delete transaction_path(transactions.first.id), as: :json
      expect(response).to have_http_status(:no_content)
    end

    it 'deletes the Transaction' do
      expect do
        delete transaction_path(transactions.first.id), as: :json
      end.to change(Transaction, :count).by(-1)
    end
  end

  context 'when transaction id exists and belongs to another user' do
    let(:another_transaction) { create(:transaction) }

    it 'throws an error' do
      expect do
        delete transaction_path(another_transaction.id), as: :json
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  context 'when transaction id does not exist' do
    it 'throws an error' do
      expect do
        delete transaction_path(17), as: :json
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
