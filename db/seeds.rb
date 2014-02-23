# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
goals = []

# The units for distance is feet
goals << Goal.create(name: "Mount Everest", distance: "29029")
goals << Goal.create(name: "Empire State Building", distance: "1454")
goals << Goal.create(name: "New York/Los Angeles", distance: "12926971.2")
goals << Goal.create(name: "Earth/Moon", distance: "1261392000")
