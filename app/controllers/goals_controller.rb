class GoalsController < ApplicationController
  require 'wolfram-alpha'

  def index
    @goals = Goal.all
    # prints out all of the goals in section three of the index
  end

  def new
    @goal = Goal.new
  end

  def create
    query = params[:goal]
    #querying wolfram alpha
    options = { "format" => "plaintext"} 
    #asking for the response in plaintext
    client = WolframAlpha::Client.new ENV["WOLFRAM_ID"], options
    #telling wolfram alpha who's asking

    @response = client.query query["name"]
    #renaming the query to 'name'
    result = @response.find { |pod| pod.id == "Result" }
    #looking for the 'subpod' with the ID of 'Result'
    #from what wolfram alpha sends us back
    if !result.nil?
    #if there isn't a subpod with a 'Result' ID, do this:
      answer = result.subpods.first.plaintext
      #find the first subpod wolfram alpha returns
      @goal = Goal.new
      #create a new goal with a name, input interpretation (string), and distance (number)
      @goal.name = query["name"]
      @goal.input_interpretation = answer
      #return only the number from the input_interpretation string
      @goal.distance = answer.to_f
 
      if answer.include? "miles"
      #if the input interpretation includes the string "miles" save it
        @goal.save
        #call the add_goal_to_current_user function
        add_goal_to_current_user(@goal)

        #redirect to index page w/ the goal listed under user's goal
        redirect_to goals_path, :notice => "Goal added!"
      else
        flash[:error]='This does not return a distance in miles. Try again.'
        #send the user back to generate a new, valid goal
        render :new
      end
    else
      answer = nil
      flash[:error] = "No answer. Please try again."
      #again-send the user back to generate a new valid goal
      #this is a redirect because a nil answer breaks the code
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

    #need to find the current user by their ID to save in DB
    User.find(current_user.id).update_attributes(
      #generating the start date
      :goal => current_user.goal, :start_date => current_user.start_date
    )
  end
end


