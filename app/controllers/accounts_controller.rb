class AccountsController < ApplicationController

  def show
    render json: account
  end

  private
  
  def account
    @account ||= Account.find(params[:id])
  end
end
