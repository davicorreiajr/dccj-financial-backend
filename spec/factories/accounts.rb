# == Schema Information
#
# Table name: accounts
#
#  id         :bigint(8)        not null, primary key
#  balance    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :account do
    balance 1
  end
end
