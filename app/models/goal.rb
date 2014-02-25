class Goal < ActiveRecord::Base
  validates :name, :presence => true
end