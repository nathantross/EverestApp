class User < ActiveRecord::Base
  has_one :goal
  # validates :name, :provider, :uid, :oauth_token, :oauth_secret, :presence => true
  # validates :email, uniqueness: { case_sensitive: false }
  # validates :uid, uniqueness: true
  # validates :oauth_token, uniqueness: true
  # validates :oauth_secret, uniqueness: true

  def self.create_with_omniauth(auth)
    create! do |user|
       user.provider = auth["provider"]
       user.uid = auth["uid"]
       user.name = auth["info"]["name"]
       user.oauth_token = auth['credentials']['token']
       user.oauth_secret = auth['credentials']['secret']
    end
  end


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
      
