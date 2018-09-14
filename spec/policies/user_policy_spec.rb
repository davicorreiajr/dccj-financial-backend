# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  subject { described_class.new(current_user, user) }

  context 'when user is not logged' do
    let(:current_user) { nil }
    let(:user) { nil }

    it { is_expected.to forbid_actions(%i[show update]) }
    it { is_expected.to permit_action(:create) }
  end

  context 'when user is logged' do
    let(:current_user) { create(:user) }
    let(:user) { nil }

    it { is_expected.to forbid_action(:create) }

    context 'when accessing the logged user' do
      let(:user) { current_user }

      it { is_expected.to permit_actions(%i[show update]) }
    end

    context 'when accessing another user' do
      let(:user) { create(:user) }

      it { is_expected.to forbid_actions(%i[show update]) }
    end
  end
end