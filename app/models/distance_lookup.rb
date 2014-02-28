class DistanceLookup
  include ActiveModel::Validations
  attr_accessor :name, :distance, :raw_result

  validates :name, presence: true
  validates :raw_result, matches miles

   def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def self.lookup(name)

    lookup = DistanceLookup.new(name: name)

    #run name validations

    options = { "format" => "plaintext"} 
    client = WolframAlpha::Client.new("WAH272-2G2QR5X7L6", options)

    response = client.query name
    result = response.find { |pod| pod.id == "Result" }
    unless result.nil?
      lookup.raw_result = result.subpods.first.plaintext
      lookup.distance = input_interpretation.to_f
    end  

    lookup
   end

   def as_goal
    goal = Goal.new(name: name, 
          input_interpretation: raw_result,
          distance: distance)

   end

end    