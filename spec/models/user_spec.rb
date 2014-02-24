require 'spec_helper'

describe User do
  it "is valid with a name, email, provider, uid, oauth_token, oauth_secret" do
    user = User.new(
      name: "Jane EverestClimber",
      email: "jane@example.com",
      provider: "fitbit",
      uid: "wnd84jr92bdk",
      oauth_token: "2j5jf93jd84kf94",
      oauth_secret: "3j8dn48rj58xn40")
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    expect(User.new(name: nil)).to have(1).errors_on(:name)
  end

  it "is invalid without an email address" do
    expect(User.new(email: nil)).to have(1).errors_on(:email)
  end

  it "is invalid without a provider" do
    expect(User.new(provider: nil)).to have(1).errors_on(:provider)
  end

  it "is invalid without a uid" do
    expect(User.new(uid: nil)).to have(1).errors_on(:uid)
  end

  it "is invalid without an oauth_token" do
    expect(User.new(oauth_token: nil)).to have(1).errors_on(:oauth_token)
  end

  it "is invalid without an oauth_secret" do
    expect(User.new(oauth_secret: nil)).to have(1).errors_on(:oauth_secret)
  end

  describe "invalidate duplicate fields" do
    before :each do
      @user_jane = User.create(
        name: "Jane EverestClimber",
        email: "user@example.com",
        provider: "fitbit",
        uid: "s9f93k4j5jf9",
        oauth_token: "2j5jf93jd84kf94",
        oauth_secret: "3j8dn48rj58xn40")

      @user_joe = User.create(
        name: "Joe EverestClimber",
        email: "user@example.com",
        provider: "fitbit",
        uid: "3n5nsn58dj5m",
        oauth_token: "2n58dn47em48dj3",
        oauth_secret: "2n58dn37szm5yxb")

      @user_jill = User.create(
        name: "Jill EverestClimber",
        email: "jill@example.com",
        provider: "fitbit",
        uid: "s9f93k4j5jf9",
        oauth_token: "2n3n4md74gsjfdm",
        oauth_secret: "4nt8dk5lfba62h4")
    end

    it "is invalid with a duplicate email address" do
      expect(@user_joe).to have(1).errors_on(:email)
    end

    it "is invalid with a duplicate uid" do
      expect(@user_jill).to have(1).errors_on(:uid)
    end
  end

  it "returns a contact's full name as a string" do
    user = User.new(
      name: "Testy McTesterson",
      email: "tester@example.com",
      provider: "fitbit",
      uid: "s9f93k4j5jf9",
      oauth_token: "2j5jf93jd84kf94",
      oauth_secret: "3j8dn48rj58xn40")
    expect(user.name).to eq "Testy McTesterson"
  end
end




















