# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def show?
    user_logged? && (user == record)
  end
end
