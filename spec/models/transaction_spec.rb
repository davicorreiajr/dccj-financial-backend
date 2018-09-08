# frozen_string_literal: true

# == Schema Information
#
# Table name: transactions
#
#  id          :bigint(8)        not null, primary key
#  description :string
#  value       :float            not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  account_id  :integer          not null
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'relationships' do
    it { should belong_to(:account) }
  end

  context 'validations' do
    it { should validate_presence_of(:value) }
  end
end
