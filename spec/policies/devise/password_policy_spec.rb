# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Devise::PasswordPolicy, type: :policy do
  subject { described_class.new(user, record) }

  context 'when user is not logged' do
    let(:user) { nil }
    let(:record) { create(:user) }

    it { is_expected.to forbid_action(:update) }
  end

  context 'when user is logged' do
    let(:user) { create(:user) }
    let(:record) { user }

    it { is_expected.to permit_action(:update) }
  end
end
