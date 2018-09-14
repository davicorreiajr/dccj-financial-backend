# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TransactionPolicy, type: :policy do
  subject { described_class.new(user, transaction) }

  let(:resolved_scope) do
    described_class::Scope.new(user, Transaction.all).resolve
  end

  context 'when user is not logged' do
    let(:user) { nil }
    let(:transaction) { create(:transaction) }

    it { is_expected.to forbid_actions([:index, :create, :update, :destroy]) }
  end

  context 'when user is logged' do
    let(:user) { create(:user, :with_account) }
    let(:account) { user.account }
    let(:transactions) { create_list(:transaction, 30, account: account) }
    let(:transaction) { transactions.first }

    it { is_expected.to permit_action(:index) }

    context 'when accessing transaction from the logged user' do
      it { is_expected.to permit_actions([:create, :update, :destroy]) }

      it 'includes transaction in resolved scope' do
        expect(resolved_scope).to include(transaction)
      end
    end

    context 'when accessing transaction from another user' do
      let(:transaction) { create(:transaction) }

      it { is_expected.to forbid_actions([:create, :update, :destroy]) }

      it 'excludes transaction from resolved scope' do
        expect(resolved_scope).not_to include(transaction)
      end
    end
  end
end
