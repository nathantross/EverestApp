class Goal < ActiveRecord::Base
  has_many :users
  validates :name, :input_interpretation, :distance, :presence => true

end

