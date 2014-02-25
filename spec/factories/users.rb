FactoryGirl.define do 
  factory :user do
    name "Testy McTesterson"
    sequence(:email) { |n| "testymctesterson#{n}@example.com"}
    provider "fitbit"
    uid "s9f93k4j5jf9"
    oauth_token "2j5jf93jd84kf94"
    oauth_secret "3j8dn48rj58xn40"
    goal_id "1"
  end 
end