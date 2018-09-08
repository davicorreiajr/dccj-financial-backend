# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Transaction creation', type: :request do
  let(:json) { JSON.parse(response.body) }

  context 'when account id exists' do
    let(:account) { create(:account) }

    before do
      post account_transactions_path(account.id), params: params, as: :json
    end

    context 'with valid params' do
      let(:value) { rand(-10.0..10.0).round(2) }
      let(:description) { 'bleus' }
      let(:params) { { value: value, description: description } }

      it 'returns a JSON with :created status' do
        expect_json_and_status(:created)
      end

      it 'creates a Transaction' do
        expect do
          post account_transactions_path(account.id), params: params, as: :json
        end.to change(Transaction, :count).by(1)
      end

      it 'returns an object with the params sent' do
        expect(json['value']).to eq(value)
        expect(json['description']).to eq(description)
      end
    end

    context 'with invalid params' do
      let(:params) { { description: 'bleus' } }

      it 'returns a JSON with :unprocessable_entity status' do
        expect_json_and_status(:unprocessable_entity)
      end
    end
  end

  context 'when accound id does not exist' do
    let(:value) { rand(-10.0..10.0).round(2) }
    let(:description) { 'bleus' }
    let(:params) { { value: value, description: description } }

    it 'throws an error' do
      expect do
        post account_transactions_path(17), params: params, as: :json
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
