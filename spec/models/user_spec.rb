require 'spec_helper'

describe User do
  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid 
  end

  it "is invalid without a name" do
    user = FactoryGirl.build(:user, name: nil)
    expect(user).to have(1).errors_on(:name)
  end

  it "is invalid without an email address" do
    user = FactoryGirl.build(:user, email: nil)
    expect(user).to have(1).errors_on(:email)
  end

  it "is invalid without a provider" do
    user = FactoryGirl.build(:user, provider: nil)
    expect(user).to have(1).errors_on(:provider)
  end

  it "is invalid without a uid" do
    user = FactoryGirl.build(:user, uid: nil)
    expect(user).to have(1).errors_on(:uid)
  end

   it "is invalid without an oauth_token" do
    user = FactoryGirl.build(:user, oauth_token: nil)
    expect(user).to have(1).errors_on(:oauth_token)
  end

  it "is invalid without an oauth_secret" do
    user = FactoryGirl.build(:user, oauth_secret: nil)
    expect(user).to have(1).errors_on(:oauth_secret)
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
    user = FactoryGirl.build(:user, oauth_token: "5n68fn4gazxm10d")
    expect(user).to have(1).errors_on(:oauth_token)
  end

end




















