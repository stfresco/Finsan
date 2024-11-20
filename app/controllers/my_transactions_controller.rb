class MyTransactionsController < ApplicationController
  
  def index
    @transactions = MyTransaction.all
  end

  def new
    @transaction = MyTransaction.new
  end

  def create
    @transaction = MyTransaction.new(transaction_params)
    if @transaction.save
      redirect_to transaction_path(@transaction), notice: "You have made a new transaction!"
    else
      render :new, alert: "There was a problem processing your transaction🙁"
    end
  end

  def show
    @transaction = MyTransaction.find(params[:id])
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :date, :method, :description)
  end
end
