# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Transaction creation', type: :request do
  let(:json) { JSON.parse(response.body) }

  context 'when transaction id exists' do
    let(:transaction) { create(:transaction) }

    before do
      put transaction_path(transaction.id), params: params, as: :json
      transaction.reload
    end

    context 'with valid params' do
      let(:new_value) { rand(-10.0..10.0).round(2) }
      let(:new_description) { 'bleus' }
      let(:params) { { value: new_value, description: new_description } }

      it 'returns a JSON with :ok status' do
        expect_json_and_status(:ok)
      end

      it 'updates the Transaction' do
        expect(transaction.value).to eq(new_value)
        expect(transaction.description).to eq(new_description)
      end

      it 'returns an object with the params sent' do
        expect(json['value']).to eq(new_value)
        expect(json['description']).to eq(new_description)
      end
    end

    context 'with invalid params' do
      let(:params) { { value: nil, description: 'bleus' } }

      it 'returns a JSON with :unprocessable_entity status' do
        expect_json_and_status(:unprocessable_entity)
      end
    end
  end

  context 'when transaction id does not exist' do
    let(:value) { rand(-10.0..10.0).round(2) }
    let(:description) { 'bleus' }
    let(:params) { { value: value, description: description } }

    it 'throws an error' do
      expect do
        put transaction_path(17), params: params, as: :json
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
