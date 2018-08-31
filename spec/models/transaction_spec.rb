# == Schema Information
#
# Table name: transactions
#
#  id          :bigint(8)        not null, primary key
#  description :string
#  value       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
