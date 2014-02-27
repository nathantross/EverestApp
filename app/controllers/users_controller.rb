class UsersController < ApplicationController
  def index
    @users = User.all
  end
 
  def show
    @user = User.find(params[:id])
  end

  # method to provide json data for graphing
  def run
    plot = plot_time

    # returns an array of hashes each with two keys,
    # one for date and a value for distance
    run_points = plot["activities-tracker-distance"]

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
    plot = plot_time
    run_points = plot["activities-tracker-distance"]
    max_val = current_user.goal.distance

    # creates an array from the distance values of each point
    acc = []
    run_points.each do |point|
      acc.push(point.fetch('value'))
    end

    # returns a sum of the points we just made into an array
    completed = acc.inject do |sum, value|
                  sum + value
                end
                
    # converts the sum into a percent of the total distance of the goal
    percent_done = (completed/max_val) * 100
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
