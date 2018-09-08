class TransactionsController < ApplicationController

  def index
    paginate json: transactions
  end

  def create
    transaction = account.transactions.build(transaction_params)

    if transaction.save
      render json: transaction, status: :created
    else
      render json: transaction.errors, status: :unprocessable_entity
    end
  end

  private

  def transactions
    @transactions ||= Transaction.all
  end

  def account
    @account ||= Account.find(params[:account_id])
  end

  def transaction_params
    params.require(:transaction).permit(:value, :description)
  end
end
