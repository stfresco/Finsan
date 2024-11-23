class BalancesController < ApplicationController
  before_action :set_account, only: [:show]
  before_action :set_balance, only: [:show, :edit, :update, :destroy]
  def index
    @balances = Balance.all
  end

  def show
  end

  def new
    @balance = Balance.new
  end

  def create
    @balance = Balance.new(balance_params)
    if @balance.save
      redirect_to balance_path(@balance)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @balance.update(balance_params)
      redirect_to balance_path(@balance)
    else
      render :edit
    end
  end

  def destroy
    @balance.destroy
    redirect_to balances_path, status: :see_other
  end

  private

  def balance_params
    params.require(:balance).permit(:account_id, :total_amount, :status)
  end

  def set_account
    @account = Account.find_by(id: params[:account_id])
    redirect_to accounts_path, alert: "Cuenta no encontrada" unless @account
  end

  def set_balance
    return unless @account
    @balance = @account.balance
    redirect_to account_path(@account), alert: "el balance no existe" unless @balance
  end
end
