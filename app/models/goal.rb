class Goal < ActiveRecord::Base
  validates :name, :input_interpretation, :distance, :presence => true
end

