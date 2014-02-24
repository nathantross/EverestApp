require 'spec_helper'

describe User do
  it "has a valid factory" do
    expect(build(:user)).to be_valid 
  end

  it "is invalid without a name" do
    expect(build(:user, name: nil)).to have(1).errors_on(:name)
  end

  it "is invalid without an email address" do
    expect(build(:user, email: nil)).to have(1).errors_on(:email)
  end

  it "is invalid without a provider" do
    expect(build(:user, provider: nil)).to have(1).errors_on(:provider)
  end

  it "is invalid without a uid" do
    expect(build(:user, uid: nil)).to have(1).errors_on(:uid)
  end

   it "is invalid without an oauth_token" do
    expect(build(:user, oauth_token: nil)).to have(1).errors_on(:oauth_token)
  end

  it "is invalid without an oauth_secret" do
    expect(build(:user, oauth_secret: nil)).to have(1).errors_on(:oauth_secret)
  end

  it "returns a user's name as a string" do
    user = FactoryGirl.build(:user, 
      name: "Testy McTesterson")
    expect(user.name).to eq "Testy McTesterson"
  end

  it "is invalid with a duplicate email address" do
    FactoryGirl.create(:user, email: "fitbitpro@example.com")
    user = FactoryGirl.build(:user, email: "fitbitpro@example.com")
    expect(user).to have(1).errors_on(:email)
  end

  it "is invalid with a duplicate uid" do
    FactoryGirl.create(:user, uid: "2m58end73nd7")
    user = FactoryGirl.build(:user, uid: "2m58end73nd7")
    expect(user).to have(1).errors_on(:uid)
  end

  it "is invalid with a duplicate oauth_token" do
    FactoryGirl.create(:user, oauth_token: "md83nd74nf72bs7")
    user = FactoryGirl.build(:user, oauth_token: "md83nd74nf72bs7")
    expect(user).to have(1).errors_on(:oauth_token)
  end

  it "is invalid with a duplicate oauth_secret" do
    FactoryGirl.create(:user, oauth_secret: "5n68fn4gazxm10d")
    user = FactoryGirl.build(:user, oauth_secret: "5n68fn4gazxm10d")
    expect(user).to have(1).errors_on(:oauth_secret)
  end

end




















