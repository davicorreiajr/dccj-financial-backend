# frozen_string_literal: true

class AccountPolicy < ApplicationPolicy
  def show?
    user_logged? && (account == record)
  end
end
