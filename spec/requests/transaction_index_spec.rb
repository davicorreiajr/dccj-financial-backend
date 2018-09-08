# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Transaction index', type: :request do
  let(:json) { JSON.parse(response.body) }
  let(:account) { create(:account) }
  let!(:transactions) { create_list(:transaction, 30, account: account) }
  let(:page) { 2 }
  let(:per_page) { 10 }
  let(:params) { { page: page, per_page: per_page } }
  let(:gotten_ids) { json.map { |item| item['id'] } }
  let(:expected_ids) { Transaction.page(page).per(per_page).map(&:id) }

  before do
    get account_transactions_path(account.id), params: params, as: :json
  end

  it 'returns a JSON with :ok status' do
    expect_json_and_status(:ok)
  end

  it 'returns an array' do
    expect(json).to be_an(Array)
  end

  it 'returns the transactions of the correct page' do
    expect(gotten_ids).to match_array(expected_ids)
  end
end
