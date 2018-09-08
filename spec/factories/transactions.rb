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

FactoryBot.define do
  factory :transaction do
    sequence(:value) { |n| n * rand(-10.0..10.0).round(2) }
    description { 'mochilão' }
    account
  end
end
