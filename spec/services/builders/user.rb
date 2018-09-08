require 'rails_helper'

RSpec.describe 'Builders::User', type: :builder do
  describe '#build' do
    let(:user_params) { { name: 'Davi', email: 'davicorreiajr@gmail.com' } }
    let(:subject) { Builders::User.new(user_params) }
    let(:user) { subject.build }

    it 'creates an account' do
      expect(user.account).to be_an(Account)
    end

    it 'creates an user' do
      expect(user).to be_an(User)
    end

    it 'creates an user with the passed params' do
      expect(user.name).to eq(name)
      expect(user.email).to eq(email)
    end
  end
end
