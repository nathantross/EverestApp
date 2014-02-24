class User < ActiveRecord::Base
  has_one :goal
  #validates :name, :email, :presence => true

  def self.create_with_omniauth(auth)
  create! do |user|
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.name = auth["info"]["name"]
  end
end

end
