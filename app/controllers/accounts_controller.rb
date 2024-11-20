class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  def index
    @accounts = Account.all
  end

  def show
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.user = current_user
    if @account.save
      @account.balance = Balance.create(total_amount: 0, status: true)

      redirect_to account_path(@account)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @account.update(account_params)
      redirect_to account_path(@account)
    else
      render :edit
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
  end
end
