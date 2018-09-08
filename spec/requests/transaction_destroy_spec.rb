require 'rails_helper'

RSpec.describe 'Transaction destroy', type: :request do
  let(:json) { JSON.parse(response.body) }
  let!(:transactions) { create_list(:transaction, 3) }

  context 'when transaction id exists' do

    it 'returns a :no_content status' do
      delete transaction_path(transactions.first.id), as: :json
      expect(response).to have_http_status(:no_content)
    end

    it 'deletes the Transaction' do
      expect{
        delete transaction_path(transactions.first.id), as: :json
      }.to change(Transaction, :count).by(-1)
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