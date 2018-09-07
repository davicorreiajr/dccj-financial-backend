require 'rails_helper'

RSpec.describe 'User creation', type: :request do
  
  before do
    post users_path, params: params, as: :json
  end

  context 'with valid params' do
    let(:name) { 'Davi Cesar' }
    let(:email) { 'davicorreiajr@gmail.com' }
    let(:params) {{ name: name, email: email }}
    let(:user) { User.new(params) }
    let(:builder) { instance_double('Builders::User') }

    it 'returns a JSON with :created status' do
      expect_json_and_status(:created)
    end

    it 'calls User builder' do
      expect(Builders::User).to receive(:new).with(params).and_return(builder)
      expect(builder).to receive(:build).and_return(user)
      post users_path, params: params, as: :json
    end
  end

  context 'with invalid params' do
  end
end
