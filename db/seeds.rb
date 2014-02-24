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
goals << Goal.create(name: "Mount Killimanjaro Marangu Route", distance: "211200")
goals << Goal.create(name: "The center of the Earth", distance: "20902464")

users = []

users << User.create(name: "Amy", email: "amy@example.com", uid: "abcd1234", goal_id: "1", avatar: "https://2.gravatar.com/avatar/38a8f34456c453bb345ea4e0d3325640?d=https%3A%2F%2Fidenticons.github.com%2F1ad0a6b1bc92e6d334164df927ce13f2.png&r=x&s=440")
users << User.create(name: "Ryan", email: "ryan@example.net", uid: "dfgh6789", goal_id: "2", avatar: "https://1.gravatar.com/avatar/3605b2f349f61c198f88179211f69b10?d=https%3A%2F%2Fidenticons.github.com%2F8af7924af6de98c9f81d8dc3c723b599.png&r=x&s=440")
users << User.create(name: "Nathan", email: "nathan@example.gov", uid: "9023kjas", goal_id: "3", avatar: "https://0.gravatar.com/avatar/2a0bb9f774f55d3210bbd0acf134f479?d=https%3A%2F%2Fidenticons.github.com%2F5d282931e9bf03e47c9b1ba157208a9a.png&r=x&s=440")
users << User.create(name: "Amanda", email: "amanda@example.com", uid: "6723kjhd", goal_id: "4", avatar: "https://2.gravatar.com/avatar/c16bff7ba3b6d55ccf9705d90b97ab5c?d=https%3A%2F%2Fidenticons.github.com%2F318f73335b30111b9024fb362c36a170.png&r=x&s=440")
users << User.create(name: "Matthew", email: "matthew@aol.com", uid: "1046dkja", goal_id: "1", avatar: "https://2.gravatar.com/avatar/38a8f34456c453bb345ea4e0d3325640?d=https%3A%2F%2Fidenticons.github.com%2F1ad0a6b1bc92e6d334164df927ce13f2.png&r=x&s=440")
users << User.create(name: "Calvin", email: "calvin@comcast.net", uid: "9471jdmc", goal_id: "2", avatar: "https://1.gravatar.com/avatar/3605b2f349f61c198f88179211f69b10?d=https%3A%2F%2Fidenticons.github.com%2F8af7924af6de98c9f81d8dc3c723b599.png&r=x&s=440")
users << User.create(name: "Josh", email: "josh@aol.com", uid: "9275jaem", goal_id: "3", avatar: "https://0.gravatar.com/avatar/2a0bb9f774f55d3210bbd0acf134f479?d=https%3A%2F%2Fidenticons.github.com%2F5d282931e9bf03e47c9b1ba157208a9a.png&r=x&s=440")
users << User.create(name: "Kevin", email: "kevin@comcast.net", uid: "1w3e5tf7", goal_id: "4", avatar: "https://2.gravatar.com/avatar/c16bff7ba3b6d55ccf9705d90b97ab5c?d=https%3A%2F%2Fidenticons.github.com%2F318f73335b30111b9024fb362c36a170.png&r=x&s=440")
users << User.create(name: "Sam", email: "sam@hotmail.com", uid: "6h7j4f9m", goal_id: "1", avatar: "https://2.gravatar.com/avatar/38a8f34456c453bb345ea4e0d3325640?d=https%3A%2F%2Fidenticons.github.com%2F1ad0a6b1bc92e6d334164df927ce13f2.png&r=x&s=440")
users << User.create(name: "Nikki", email: "nikki@hotmail.com", uid: "2s5g3d6h", goal_id: "2", avatar: "https://1.gravatar.com/avatar/3605b2f349f61c198f88179211f69b10?d=https%3A%2F%2Fidenticons.github.com%2F8af7924af6de98c9f81d8dc3c723b599.png&r=x&s=440")
users << User.create(name: "Jessie", email: "jessie@example.gov", uid: "0l5k8d7f", goal_id: "3", avatar: "https://0.gravatar.com/avatar/2a0bb9f774f55d3210bbd0acf134f479?d=https%3A%2F%2Fidenticons.github.com%2F5d282931e9bf03e47c9b1ba157208a9a.png&r=x&s=440")
users << User.create(name: "Joe", email: "joe@gmail.com", uid: "0r7v73nd", goal_id: "4", avatar: "https://2.gravatar.com/avatar/c16bff7ba3b6d55ccf9705d90b97ab5c?d=https%3A%2F%2Fidenticons.github.com%2F318f73335b30111b9024fb362c36a170.png&r=x&s=440")
users << User.create(name: "Jane", email: "jane@gmail.com", uid: "0f73end7", goal_id: "1", avatar: "https://2.gravatar.com/avatar/c16bff7ba3b6d55ccf9705d90b97ab5c?d=https%3A%2F%2Fidenticons.github.com%2F318f73335b30111b9024fb362c36a170.png&r=x&s=440")