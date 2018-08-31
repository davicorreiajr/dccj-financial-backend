# == Schema Information
#
# Table name: accounts
#
#  id         :bigint(8)        not null, primary key
#  balance    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Account < ApplicationRecord

  belongs_to :user
end
