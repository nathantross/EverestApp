class User < ActiveRecord::Base
  #validates :name, :email, :presence => true

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['proiver']
      user.uid = auth['uid']
      user.name = auth['user_info']
    end
  end

end
