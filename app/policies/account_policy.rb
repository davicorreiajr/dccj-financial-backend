class AccountPolicy < ApplicationPolicy

  def show?
    user_logged? and account == record
  end
end