# frozen_string_literal: true

class Builders::User
  attr_private_initialize :user_params

  def build
    build_account
    user
  end

  private

  def build_account
    user.build_account
  end

  def user
    @user ||= ::User.new(name: name, email: email, password: password)
  end

  def name
    @name ||= user_params[:name]
  end

  def email
    @email ||= user_params[:email]
  end

  def password
    @password ||= user_params[:password]
  end
end
