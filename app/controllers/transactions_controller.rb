# frozen_string_literal: true

class TransactionsController < ApplicationController
  def index
    authorize Transaction
    paginate json: transactions
  end

  def create
    transaction = account.transactions.build(transaction_params)
    authorize transaction

    if transaction.save
      render json: transaction, status: :created
    else
      render json: transaction.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize transaction

    if transaction.update(transaction_params)
      render json: transaction
    else
      render json: transaction.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize transaction

    transaction.destroy
    head :no_content
  end

  private

  def transaction
    @transaction ||= policy_scope(Transaction).find(params[:id])
  end

  def transactions
    @transactions ||= policy_scope(Transaction).with_account(account)
  end

  def account
    @account ||= Account.find(params[:account_id])
  end

  def transaction_params
    params.require(:transaction).permit(:value, :description)
  end
end
