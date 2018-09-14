# frozen_string_literal: true

class Devise::PasswordPolicy < ApplicationPolicy
  def update?
    user_logged?
  end
end
