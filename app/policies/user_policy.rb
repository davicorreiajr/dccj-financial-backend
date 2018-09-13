# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  
  def create?
    true
  end
  
  def show?
    user_logged? && (user == record)
  end
end
