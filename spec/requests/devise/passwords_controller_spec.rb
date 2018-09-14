# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::PasswordsController, type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:user) { create(:user) }

  before do
    sign_in user
    put user_password_path, params: params, as: :json
  end

  describe '#update' do
    let(:password) { 'bleus122345' }

    context 'with valid params' do
      let(:params) { { password: password, password_confirmation: password } }

      it 'returns a :no_content status' do
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when password and password_confirmation do not match' do
      let(:params) { { password: password, password_confirmation: password + '1' } }

      it 'returns a JSON with :unprocessable_entity status' do
        expect_json_and_status(:unprocessable_entity)
      end
    end
  end
end
