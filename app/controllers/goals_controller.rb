class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new

  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
      redirect_to goals_path(@goal), notice: "You have registered a new goal"
    else
      render :new, status: :unprocessable_entity, alert: "We had a problem processing your goal"
    end
  end

  def show
    @goal = Goal.find(params[:id])
    @accounts = current_user.accounts
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
      if @goal.update(goal_params)
        redirect_to goals_path
      else
        render :edit
      end
  end

  def destroy
    @goal = Goal.find(params[:id])
      if @goal.destroy
        redirect_to goals_path
      end
  end

  def my_transaction
    @transaction = MyTransaction.new
    @account = Account.find(params[:account])
  end

  def create_goal_transaction
    # Primero, encuentra la cuenta
    @account = Account.find(params[:account])

    # Extrae los parámetros de la transacción
    transaction_params = params[:my_transaction]

    @transaction = MyTransaction.new(
      account: @account,
      category: transaction_params[:category],
      amount: transaction_params[:amount],
      date: transaction_params[:date],
      method: transaction_params[:method],
      description: transaction_params[:description],
      mytransaction_type: transaction_params[:mytransaction_type],
      goal_id: transaction_params[:goal]
    )
    # @transaction = MyTransaction.new(transaction_params.merge(account: @account))

    # Intenta guardar la transacción
    if @transaction.save
      redirect_to goal_path(transaction_params[:goal]),
        notice: "Estás más cerca de tu objetivo"
    else

      # Manejo de errores si la transacción no se puede guardar
      render "goals/my_transaction"
    end
  end

  private

  # def transaction_params
  #   params.require(:my_transaction).permit(:category, :amount, :date, :description, :method, :mytransaction_type, :goal)
  # end

  def goal_params
    params.require(:goal).permit(:title, :description, :status, :start_date, :finish_date, :amount)
  end
end
