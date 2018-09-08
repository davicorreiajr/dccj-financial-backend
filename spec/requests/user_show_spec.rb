require 'rails_helper'

RSpec.describe 'User show', type: :request do
  let(:name) { 'Davi Cesar' }
  let(:email) { 'davicorreiajr@gmail.com' }
  let(:user) { create(:user, name: name, email: email) }
  let(:json) { JSON.parse(response.body) }

  context 'when the :id exists' do
    it 'returns the requested user' do
      get user_path(user.id), as: :json

      expect(json['name']).to eq(user.name)
      expect(json['email']).to eq(user.email)
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
