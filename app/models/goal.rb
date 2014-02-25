class Goal < ActiveRecord::Base

  validates :name, :input_interpretation, :presence => true

end

