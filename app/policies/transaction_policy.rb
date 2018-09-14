# frozen_string_literal: true

class TransactionPolicy < ApplicationPolicy

  def create?
    user_logged? and record.account == account
  end

  class Scope < Scope

    def resolve
      scope.with_account(account)
    end
  end
end
