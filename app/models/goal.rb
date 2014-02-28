class MyLookupValidator < ActiveModel::Validator
  def validate(goal)
    goal.errors[:name] << "is invalid" if goal.distance.nil?
  end
end

class Goal < ActiveRecord::Base
  has_many :users
  validates :name, :presence => true
  validates_with MyLookupValidator

  def self.lookup(name)

    goal = Goal.new(name: name)

    #run name validations

    options = { "format" => "plaintext"} 
    client = WolframAlpha::Client.new("WAH272-2G2QR5X7L6", options)

    response = client.query name
    result = response.find { |pod| pod.id == "Result" }
    unless result.nil?
      goal.input_interpretation = result.subpods.first.plaintext
      if goal.input_interpretation.include? "miles"
        goal.distance = goal.input_interpretation.to_f
      end
    end  
    goal
   end
end

