# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  def update
    skip_policy_scope
    authorize current_user, policy_class: Devise::PasswordPolicy

    if current_user.reset_password(password, password_confirmation)
      head :no_content
    else
      render json: current_user.errors, status: :unprocessable_entity
    end
  end

  private

  def password
    @password ||= params[:password]
  end

  def password_confirmation
    @password_confirmation ||= params[:password_confirmation]
  end
end
