# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User show', type: :request do
  let(:user) { create(:user) }
  let(:json) { JSON.parse(response.body) }

  before do
    sign_in user
  end

  context 'when the :id exists and it is the logged user' do
    it 'returns the requested user' do
      get user_path(user.id), as: :json

      expect(json['id']).to eq(user.id)
      expect(json['name']).to eq(user.name)
      expect(json['email']).to eq(user.email)
    end
  end

  context 'when the :id exists but it is not the logged user' do
    let(:another_user) { create(:user) }

    it 'throws an error' do
      expect do
        get user_path(another_user.id), as: :json
      end.to raise_error(Pundit::NotAuthorizedError)
    end
  end

  context 'when the :id does not exist' do
    it 'throws an error' do
      expect do
        get user_path(2), as: :json
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
