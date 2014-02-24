require 'spec_helper'

describe User do
  it "is valid with a name, email, provider, uid, oauth_token, oauth_secret"
  it "is invalid without a name"
  it "is invalid without an email address"
  it "is invalid without a provider"
  it "is invalid without a uid"
  it "is invalid without an oauth_token"
  it "is invalid without an oauth_secret"
  it "returns a contact's full name as a string"
end



