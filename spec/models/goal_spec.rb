require 'spec_helper'

describe Goal do
  it "is valid with a name and a distance" do
    goal = Goal.new(
      name: 'Sears Tower', 
      distance: '1451')
    expect(goal).to be_valid
  end

  it "is invalid without a name" do
    expect(Goal.new(name: nil)).to have(1).errors_on(:name)
  end

  it "is invalid without a distance" do
    expect(Goal.new(distance: nil)).to have(1).errors_on(:distance)
  end

end
