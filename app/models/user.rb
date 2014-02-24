class User < ActiveRecord::Base
<<<<<<< HEAD
  has_many :authorizations
  validates :name, :email, :presence => true
=======
  has_one :goal
  #validates :name, :email, :presence => true
>>>>>>> bd2a11a8ba26c9bff745dc7517beb1e0ca35f5c7

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['proiver']
      user.uid = auth['uid']
      user.name = auth['user_info']
    end
  end

end
