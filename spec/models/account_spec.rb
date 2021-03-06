# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id         :bigint(8)        not null, primary key
#  balance    :float            default(0.0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Account, type: :model do
  context 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:transactions).dependent(:destroy) }
  end

  context 'validations' do
    it { should validate_presence_of(:balance) }
  end
end
