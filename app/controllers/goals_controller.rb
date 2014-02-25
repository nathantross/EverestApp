class GoalsController < ApplicationController
  require 'wolfram-alpha'

  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    query = params[:goal]

    options = { "format" => "plaintext"} 
    client = WolframAlpha::Client.new "WAH272-2G2QR5X7L6", options

    @response = client.query query["name"]
    result = @response.find { |pod| pod.id == "Result" }
    answer = result.subpods.first.plaintext

    @goal = Goal.new
    @goal.name = query["name"]
    @goal.input_interpretation = answer
    @goal.save

    render :show

  end

  def show
    @goal = Goal.find(params[:id])
  end

  def delete
    # @goal = Goal.find(params[:id])
    # @goal.delete
    # render :index
  end

end
