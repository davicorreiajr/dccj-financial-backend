# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    super do |resource|
      skip_authorization
    end
  end

  def destroy
    super do |resource|
      skip_authorization
      skip_policy_scope
    end
  end

  private

  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end
end
