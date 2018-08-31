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

class Transaction < ApplicationRecord

  belongs_to :account

  validates :value, presence: true
end
