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

  def update
    if transaction.update(transaction_params)
      render json: transaction
    else
      render json: transaction.errors, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def transaction
    @transaction ||= Transaction.find(params[:id])
  end

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
