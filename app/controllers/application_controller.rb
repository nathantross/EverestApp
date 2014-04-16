class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # these helpeer methods are available to the views connected
  # to every controller
  helper_method :current_user
  helper_method :fitgem_info
  helper_method :distance
  helper_method :avatar
  helper_method :climb
  helper_method :plot_time
  helper_method :empire_state

  # creates a call to the Fitgem client and associates it with
  # a particular user in session
  def fitgem_info
    @fitgem_info = current_user.fitbit_data
  end

  # gets a range of dates based on when the user added a goal and ending
  # at today. tracker/distance is only what the fitbit records (not user inputted data) 
  # for total walk/run distance.
  def plot_time
    if current_user
      unless current_user.start_date.nil?
        @plot_time = fitgem_info.activity_on_date_range("tracker/distance", current_user.start_date, 'today')
      end
    end
  end

  # gets all time distance recorded by a fitbit
  def distance
    @distance = fitgem_info.activity_statistics['lifetime']['tracker']['distance']
  end

  # gets the profile picture from fitbit
  def avatar
    
    @avatar = fitgem_info.user_info['user']['avatar']

  end

  # calculates the total feet climbed as recorded by fitbit. One floor is ten feet.
  def climb
    climb_info = fitgem_info.activity_statistics['lifetime']['tracker']['floors']
    if climb_info.nil?
      "No floors climbed!"
    else
      @climb = climb_info * 10
    end
  end

  def empire_state
    if climb.class == String
      @empire_state = 0
    else 
      @empire_state = climb / 1250
    end
  end

  private

  # sets a user connected to who has most recently signed in
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
