FactoryGirl.define do 
  factory :goal do
    name "Baltimore/Miami"

    distance "957"

    input_interpretation "string"

    factory :invalid_goal do 
      name nil
      input_interpretation nil
    end

  end 
end