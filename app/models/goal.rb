class Goal < ActiveRecord::Base
  validates :name, :distance, :presence => true

end

