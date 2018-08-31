# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  email      :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
end
