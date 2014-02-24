class GoalsController < ApplicationController
  require 'wolfram-alpha'

  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    query = params[:query]

    options = { "format" => "plaintext"} # see the reference appendix in the documentation.[1]
    client = WolframAlpha::Client.new "WAH272-2G2QR5X7L6", options

    @response = client.query "distance from earth to moon"
    # @response = client.query query

    result = @response.find { |pod| pod.id == "Result" }
    answer = result.subpods[0].plaintext

    @goal = Goal.new
    @goal.name = "input from form here"
    @goal.distance =1.1
    @goal.input_interpretation = answer
    @goal.save

    render :show

  end

  def show
    # @goal = Goal.find(params[:input_interpretation, :distance])
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
