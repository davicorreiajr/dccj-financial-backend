# frozen_string_literal: true

class AccountsController < ApplicationController
  def show
    authorize account
    render json: account
  end

  private

  def account
    @account ||= policy_scope(Account).find(params[:id])
  end
end
