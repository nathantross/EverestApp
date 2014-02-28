class GoalsController < ApplicationController
  require 'wolfram-alpha'

  def index
    @goals = Goal.all
    # where goal.id != current_user.goal_id
  end

  def new
    @goal = Goal.new
  end

  def create
    query = params[:goal]
    options = { "format" => "plaintext"} 
    
    client = WolframAlpha::Client.new ENV["WOLFRAM_ID"], options

    @response = client.query query["name"]
    result = @response.find { |pod| pod.id == "Result" }
    if !result.nil?
      answer = result.subpods.first.plaintext
      @goal = Goal.new
      @goal.name = query["name"]
      @goal.input_interpretation = answer
      @goal.distance = answer.to_f
 
      if answer.include? "miles"
        @goal.save
        add_goal_to_current_user(@goal)

        #redirect to index page w/ the goal listed under user's goal
        redirect_to goals_path, :notice => "Goal added!"
      else
        flash[:error]='This does not return a distance in miles. Try again.'
        render :new
      end
    else
      answer = nil
      flash[:error] = "No answer. Please try again."
      redirect_to new_goals_path
    end
  end

  def add
    # Currently we have one goal per user at a time.
    new_goal = Goal.find(params[:id])

    add_goal_to_current_user(new_goal)

    redirect_to goals_path, :notice => "Goal added!"
  end  

  def show
    @goal = Goal.find(params[:id])
  end

protected
  
  #add the goal to the user
  def add_goal_to_current_user(goal)
    current_user.goal = goal
        # Sets a start for the goal corresponding to the same day they
        # add it to their goal. The format is stringified to YYYY-MM-DD
    current_user.start_date = DateTime.now.strftime("%Y-%m-%d")

    User.find(current_user.id).update_attributes(
      :goal => current_user.goal, :start_date => current_user.start_date
    )
  end
end


