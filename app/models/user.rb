class User < ActiveRecord::Base
  belongs_to :goal

  # automatically populates database fields with values
  # returned from the omniauth login
  def self.create_with_omniauth(auth)
    create! do |user|
       user.provider = auth["provider"]
       user.uid = auth["uid"]
       user.name = auth["info"]["name"]
       user.oauth_token = auth['credentials']['token']
       user.oauth_secret = auth['credentials']['secret']
    end
  end

  # sets up a new instance of a client for the Fitgem gem
  # passing in the keys for our api access as well as the tokens
  # and encoded uid from fitbit
  def fitbit_data
    @client ||= Fitgem::Client.new(
                :consumer_key => ENV["FITBIT_ID"],
                :consumer_secret => ENV["FITBIT_SECRET"],
                :token => oauth_token,
                :secret => oauth_secret,
                :user_id => uid
              )
  end

  def run_points
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
      results = {
        points: run_points,
        max_val: max_val,
      }
  end
end
      
