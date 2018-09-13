# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User creation', type: :request do
  let(:json) { JSON.parse(response.body) }

  before do
    post users_path, params: params, as: :json
  end

  context 'with valid params' do
    let(:name) { 'Davi Cesar' }
    let(:email) { 'davicorreiajr@gmail.com' }
    let(:user_params) { { name: name, email: email, password: 'bleus123' } }
    let(:params) { { user: user_params } }
    let(:user) { build(:user, name: name, email: email) }
    let(:builder) { instance_double('Builders::User') }

    it 'returns a JSON with :created status' do
      expect_json_and_status(:created)
    end

    it 'returns the created user' do
      expect(json['name']).to eq(name)
      expect(json['email']).to eq(email)
    end

    it 'calls User builder' do
      expect(Builders::User).to receive(:new).with(user_params).and_return(builder)
      expect(builder).to receive(:build).and_return(user)
      post users_path, params: params, as: :json
    end
  end

  context 'with invalid params' do
    let(:params) { { name: 'Davi' } }

    it 'returns a JSON with :unprocessable_entity status' do
      expect_json_and_status(:unprocessable_entity)
    end
  end
end
