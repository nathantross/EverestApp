class UsersController < ApplicationController
   def index
     @users = User.all
   end
 
   def show
     @user = User.find(params[:id])
   end

   def run
     plot = plot_time
     run_points = plot["activities-tracker-distance"]
     max_val = current_user.goal.distance * 5280
     @results = {
      points: run_points,
      max_val: max_val,
     }
     respond_to do |f|
      f.json { render :json => @results }
    end

   end

end
