# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User update', type: :request do
  context 'when the :id exists' do
    let(:user) { create(:user) }
    let(:json) { JSON.parse(response.body) }

    before do
      put user_path(user.id), params: params, as: :json
      user.reload
    end

    context 'with valid params' do
      let(:new_name) { 'Correia Jr' }
      let(:params) {{ name: new_name, email: user.email }}

      it 'returns a JSON with :ok status' do
        expect_json_and_status(:ok)
      end

      it 'updates the requested user' do
        expect(user.name).to eq(new_name)
      end

      it 'returns the updated user' do
        expect(json['name']).to eq(new_name)
      end
    end

    context 'with invalid params' do
      let(:params) { { email: nil } }

      it 'returns a JSON with :unprocessable_entity status' do
        expect_json_and_status(:unprocessable_entity)
      end
    end
  end

  context 'when the :id does not exist' do
    it 'throws an error' do
      expect do
        put user_path(2), as: :json
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
