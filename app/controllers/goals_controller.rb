class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to goals_path(@goal), notice: "You have register a new goal"
    else
      render :new, alert: "We had a problem procesing your goal"
    end
  end

  def show
    @goal = Goal.find(params[:id])
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

  private

  def goal_params
    params.require(:goal).permit(:title, :description, :status, :start_date, :finish_date)
  end
end
