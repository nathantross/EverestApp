class UsersController < ApplicationController
  def index
    @users = User.all
  end
 
  def show
    @user = User.find(params[:id])
  end

  def restart
    current_user.start_date = DateTime.now.strftime("%Y-%m-%d")
    User.find(current_user.id).update_attributes(:start_date => current_user.start_date)

    redirect_to user_path(current_user.id), :notice => "Goal restarted, good luck!"
  end

  def quit
    current_user.goal = nil
    current_user.start_date = nil

    User.find(current_user.id).update_attributes(:goal => current_user.goal, :start_date => current_user.start_date)

    redirect_to goals_path, :notice => "Time to pick another goal?"
  end

  # method to provide json data for graphing
  def run
    plot = plot_time

    # returns an array of hashes each with two keys,
    # one for date and a value for distance
    run_points = plot["activities-tracker-distance"]
    
    # adds previous points to each subsequent point
    progress = 0
    run_points.map do |point|
      progress += point['value'].to_f  
      point['value'] = progress
    end 
    
    # the high point of the graph, which corresponds to the 
    # total distance of the goal
    max_val = current_user.goal.distance 
    @results = {
      points: run_points,
      max_val: max_val,
    }

    # sends out our @result hash to a /users/run.json query
    respond_to do |f|
      f.json { render :json => @results }
   end
  end

  def donut

    # render json: { "result" => "OK" }

    plot = plot_time
    run_points = plot["activities-tracker-distance"]
    max_val = current_user.goal.distance

    # creates an array from the distance values of each point
    acc = []
    run_points.each do |point|
      acc.push(point.fetch('value').to_f)
    end

    # returns a sum of the points we just made into an array
    completed = acc.inject do |sum, value|
                  sum + value
                end

    # converts the sum into a percent of the total distance of the goal
    percent_done = ((completed * 100 / max_val)).to_i
    percent_left = 100 - percent_done
    
    @donut_results = {
      percent_done: percent_done,
      percent_left: percent_left
    }
    
    respond_to do |f|
      f.json { render :json => @donut_results }
    end
  end

end
