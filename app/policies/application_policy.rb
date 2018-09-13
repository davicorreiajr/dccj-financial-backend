# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :account, :record

  def initialize(user, record)
    @user = user
    @account = user&.account
    @record = record
  end

  def user_logged?
    user
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
