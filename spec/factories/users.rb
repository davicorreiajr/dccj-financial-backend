# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryBot.define do
  factory :user do
    name { 'Davi Correia Jr.' }
    sequence(:email) { |n| "test#{n}@email.com" }
    sequence(:password) { |n| "bleus#{n}" }

    trait :with_account do
      after(:create) do |user|
        create(:account, user: user)
      end
    end
  end
end
