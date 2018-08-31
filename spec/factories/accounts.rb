# == Schema Information
#
# Table name: accounts
#
#  id         :bigint(8)        not null, primary key
#  balance    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :account do
    balance 1
  end
end
