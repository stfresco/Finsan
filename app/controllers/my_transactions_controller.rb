class MyTransactionsController < ApplicationController
  
  def index
    @transactions = MyTransaction.all
  end

  def new
    @transaction = MyTransaction.new
    @account = Account.find(params[:account_id])
  end

  def create
    @account = Account.find(params[:account_id])
    @transaction = MyTransaction.new(transaction_params)
    @transaction.account = @account
    if @transaction.save
      redirect_to my_transaction_path(@transaction), notice: "You have made a new transaction!"
    else
      render :new, alert: "There was a problem processing your transaction🙁"
    end
  end

  def show
    @transaction = MyTransaction.find(params[:id])
  end

  private

  def transaction_params
    params.require(:my_transaction).permit(:category, :amount, :date, :method, :description)
  end
end
