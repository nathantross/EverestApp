class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    new_goal = params.require(:goal).permit(:name, :distance)
    @goal = Goal.create(new_goal)
    if @goal.save
      redirect_to @goal
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    goal = Goal.find(params[:id])
    updated_goal = params.require(:goal).permit(:name, :distance)
    goal.update_attributes(updated_goal)
    if goal.save
      redirect_to goal
    end
  end

  def delete
    goal = Goal.find(params[:id])
    goal.destroy
  end
end
