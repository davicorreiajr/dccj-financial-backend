require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'POST create' do
    before do
      get :create, params: params, as: :json
    end

    context 'with invalid params' do
    end

    context 'with valid params' do
      let(:params) {{ name: 'Davi Cesar', email: 'davicorreiajr@gmail.com' }}

      it 'returns the new contract as json' do
        expect_json_and_status('200')
      end
    end
  end

  describe 'GET show' do
  end

  describe 'PUT update' do
  end
end
