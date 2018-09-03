require 'rails_helper'

RSpec.describe 'User creation', type: :request do

  describe 'POST create' do

    before do
      post users_path, params: params, as: :json
    end

    context 'with valid params' do
      let(:params) {{ name: 'Davi Cesar', email: 'davicorreiajr@gmail.com' }}

      it 'returns the new contract as json' do
        expect_json_and_status('200')
      end
    end

    context 'with invalid params' do
    end
  end
end