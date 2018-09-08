class TransactionsController < ApplicationController

  def index
    paginate json: transactions
  end

  private

  def transactions
    @transactions = Transaction.all
  end
end
