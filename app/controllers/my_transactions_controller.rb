class MyTransactionsController < ApplicationController
  def index
    @account = Account.find(params[:account_id])
    @transactions = @account.my_transactions
  end

  def all_transactions
    @transactions = MyTransaction.all.includes(:account)
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

  def edit
    @account = Account.find(params[:account_id])
    @transaction = @account.my_transactions.find(params[:id])
  end

  def update
    @account = Account.find(params[:account_id])
    @transaction = @account.my_transactions.find(params[:id])

    if @transaction.update(transaction_params)
      redirect_to my_transaction_path(@transaction)
    else
      render :edit
    end
  end

  def destroy
    @transaction = MyTransaction.find(params[:id])
    @account = Account.find(params[:account_id])

    if @transaction.destroy
      redirect_to account_my_transactions_path(@account), notice: 'Transaction was successfully deleted.', status: :see_other
    else
      redirect_to account_my_transactions_path(@account), alert: 'Failed to delete transaction.'
    end
  end

  private

  def transaction_params
    params.require(:my_transaction).permit(:category, :amount, :date, :method, :description, :mytransaction_type)
  end
end
