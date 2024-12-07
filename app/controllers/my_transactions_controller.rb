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

    category = params[:my_transaction][:category]
    custom_category = params[:my_transaction][:custom_category]
    if category == "Otra" && custom_category.present?
      params[:my_transaction][:My_category] = custom_category
    end

    if @transaction.save
      if params[:my_transaction][:goal_id].nil?
        redirect_to account_my_transactions_path(@account), notice: "You have made a new transaction!"
      else
        #redirect_to goal_path(params[:my_transaction][:goal_id].to_i), notice: "Estas más cerca de tu obj"
        redirect_to account_path(@account)
      end

    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @transaction = MyTransaction.find(params[:id])
    @account = @transaction.account
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
      if request.referer&.include?('all_transactions')
        redirect_to all_transactions_path, notice: 'Transaction was successfully deleted.', status: :see_other
      else
        redirect_to account_my_transactions_path(@account), notice: 'Transaction was successfully deleted.', status: :see_other
      end
    else
      if request.referer&.include?('all_transactions')
        redirect_to all_transactions_path, alert: 'Failed to delete transaction.'
      else
        redirect_to account_my_transactions_path(@account), alert: 'Failed to delete transaction.'
      end
    end
  end

  private

  def transaction_params
    params.require(:my_transaction).permit(:category, :custom_category, :amount, :date, :method, :description, :mytransaction_type, :goal_id, :account_id)
  end
end
