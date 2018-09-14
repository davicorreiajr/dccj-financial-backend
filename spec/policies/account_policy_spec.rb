# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountPolicy, type: :policy do
  subject { described_class.new(user, account) }

  context 'when user is not logged' do
    let(:user) { nil }
    let(:account) { create(:account) }

    it { is_expected.to forbid_action(:show) }
  end

  context 'when user is logged' do
    let(:user) { create(:user, :with_account) }
    let(:account) { user.account }

    context 'when accessing account from the logged user' do
      let(:account) { user.account }

      it { is_expected.to permit_action(:show) }
    end

    context 'when accessing transaction from another user' do
      let(:account) { create(:account) }

      it { is_expected.to forbid_action(:show) }
    end
  end
end
