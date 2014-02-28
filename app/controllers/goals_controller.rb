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

    @goal = Goal.lookup(query[:name])
    
    if @goal.valid?
      @goal.save 
      #this calls the add_goal_to_current_user function
      add_goal_to_current_user(@goal)
      redirect_to goals_path, :notice => "Goal added!"
    else
       render :new
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


