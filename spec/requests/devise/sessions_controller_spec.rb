# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::SessionsController, type: :request do
  let(:json) { JSON.parse(response.body) }

  describe '#sign in' do
    let(:password) { 'bleus123' }
    let(:user) { create(:user, password: password) }

    before do
      post user_session_path, params: params, as: :json
    end

    context 'with valid params' do
      let(:params) { { user: { email: user.email, password: password } } }

      it 'returns a JSON with ok status' do
        expect_json_and_status(:ok)
      end

      it 'returns the user' do
        expect(json['id']).to eq(user.id)
        expect(json['email']).to eq(user.email)
      end
    end

    context 'with invalid params' do
      let(:params) { { user: { email: user.email, password: password + '1234' } } }

      it 'returns a JSON with unauthorized status' do
        expect_json_and_status(:unauthorized)
      end
    end
  end

  describe '#sign out' do
    let(:user) { create(:user) }

    before do
      sign_in user
      delete destroy_user_session_path, as: :json
    end

    it 'returns no_content status' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
