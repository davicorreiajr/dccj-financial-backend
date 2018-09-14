# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def create?
    !user_logged?
  end

  def show?
    user_logged? && (user == record)
  end

  def update?
    user_logged? && (user == record)
  end
end
