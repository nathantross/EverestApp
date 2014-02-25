class Goal < ActiveRecord::Base
  validates :name, :distance, :input_interpretation, :presence => true
end

