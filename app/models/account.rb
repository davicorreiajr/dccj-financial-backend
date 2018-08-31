# == Schema Information
#
# Table name: accounts
#
#  id         :bigint(8)        not null, primary key
#  balance    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ApplicationRecord
end
