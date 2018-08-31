# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  email      :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#

class User < ApplicationRecord

  has_one :account

  validates :name, presence: true
  validates :email, presence: true
end
