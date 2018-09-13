# frozen_string_literal: true

class AccountsController < ApplicationController
  def show
    authorize account
    render json: account
  end

  private

  def account
    @account ||= Account.find(params[:id])
  end
end
