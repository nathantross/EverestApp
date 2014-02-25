require 'spec_helper'

describe Goal do
  it "has a valid factory" do
    expect(build(:goal)).to be_valid 
  end

  it "is invalid without a name" do
    expect(build(:goal, name: nil)).to have(1).errors_on(:name)
  end

  it "is invalid without a distance" do
    expect(build(:goal, distance: nil)).to have(1).errors_on(:distance)
  end

  it "is invalid without an input interpretation" do
    expect(build(:goal, input_interpretation: nil)).to have(1).errors_on(:input_interpretation)
  end

end

