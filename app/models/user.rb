class User < ActiveRecord::Base
  belongs_to :goal

  # automatically populates database fields with values
  # returned from the omniauth login
  def self.create_with_omniauth(auth)
    create! do |user|
       user.provider = auth["provider"]
       user.uid = auth["uid"]
       user.name = auth["info"]["name"]

       # Need to ask Rafi (or someone) about how to save properly
       # as currently it gets stored as plaintext
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

end
      
