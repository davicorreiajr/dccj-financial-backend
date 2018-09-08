require 'rails_helper'

RSpec.describe 'Transaction index', type: :request do
  let(:json) { JSON.parse(response.body) }

  before do
    get transactions_path, as: :json
  end

  it 'returns a JSON with :ok status' do
    expect_json_and_status(:ok)
  end

  it 'returns an array of Transactions' do
    expect(json).to all be_a(Transaction)
  end

  it 'returns all the Transactions' do
    expect(json).to match_array(Transaction.all)
  end
end