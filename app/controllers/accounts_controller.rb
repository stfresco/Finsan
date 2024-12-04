class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  def index
    @accounts = Account.all
  end

  def show
    @transactions = @account.my_transactions
  end

  def new
    @account = Account.new
  end

  # def create
  #   @account = Account.new(account_params)
  #   @account.user = current_user
  #   if @account.save
  #     # @account.balance = Balance.create(total_amount: 0, status: true)
  #     @account.balance = Balance.create(account: @account, total_amount: 0, status: true)
  #     redirect_to account_path(@account)
  #   else
  #     render :new
  #   end
  # end
  def create
    @account = Account.new(account_params)
    @account.user = current_user
    if @account.save
      redirect_to account_path(@account)
    else
      render :new, status: :unprocessable_entity, alert: "We had a problem processing your goal"
    end
  end

  def edit
  end

  def update
    if @account.update(account_params)
      redirect_to account_path(@account)
    else
      render :edit, status: :unprocessable_entity, alert: "We had a problem processing your goal"
    end
  end

  def destroy
    @account.destroy
    redirect_to accounts_path, status: :see_other
  end

  private

  def account_params
    params.require(:account).permit(:bank, :account_type, :user_id, :currency)
  end

  def set_account
    @account = Account.find(params[:id])
    # if @account.nil?
    #   redirect_to account_path, alert: "acount no encontrado"
    # end
  end
end
