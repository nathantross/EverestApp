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

    @goal = Goal.lookup(query[:name])
    
    if @goal.valid?
      @goal.save 
      redirect_to goals_path, :notice => "Goal added!"
    else
       render :new
    end  


    # result_hash = Goal.get_goal_and_distance(query)
 
    # if result_hash["distance"].include? "miles"
    #   @goal.save 
    #   redirect_to goals_path, :notice => "Goal added!"
    # else
    #   flash[:error]='This does not return a distance in miles. Try again.'
    #   render :new
    # end
    
    # if 
    #   result_hash["distance"] == nil
    #   flash[:error] = "No answer. Please try again."
    #   redirect_to new_goals_path
    # end
  end

  def add
    # first two lines take the goal from the goals page and add it to a user's
    # goal. Currently we have one goal per user at a time.
    new_goal = Goal.find(params[:id])
    current_user.goal = new_goal
    
    # Sets a start for the goal corresponding to the same day they
    # add it to their goal. The format is stringified to YYYY-MM-DD
    current_user.start_date = DateTime.now.strftime("%Y-%m-%d")
    User.find(current_user.id).update_attributes(:goal => current_user.goal, :start_date => current_user.start_date)

    redirect_to user_path(current_user.id), :notice => "Goal added!"
  end  

  def show
    @goal = Goal.find(params[:id])
  end
end
