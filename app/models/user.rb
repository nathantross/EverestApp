class User < ActiveRecord::Base
  has_one :goal
  validates :name, :email, :provider, :uid, :oauth_token, :oauth_secret, :presence => true
  validates :email, uniqueness: { case_sensitive: false }
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['proiver']
      user.uid = auth['uid']
      user.name = auth['user_info']
    end
  end

end
