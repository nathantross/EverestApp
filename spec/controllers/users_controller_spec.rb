require 'spec_helper'

describe UsersController do
  before :each do
    @user = create(:user, 
      name: "Testy McTesterson", 
      email: "testymctesterson@example.com", 
      provider: "fitbit", 
      uid: "1j4d84jr8fj3",
      oauth_token: "2j48dj5lgfpbn3bs", 
      oauth_secret: "2bs84hrnf9em4b2",
      goal_id: "1",
      avatar: "string")
    session[:user_id] = @user.id
  end

  describe 'GET #index' do
    it "populates an array of users" do
      get :index
      expect(assigns(:users)).to match_array [@user]
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end

  end

  describe 'GET #show' do
    it "assigns the requested user to @user" do
      get :show, id: @user
      expect(assigns(:user)).to eq @user
    end

    it "renders the :show template" do
      get :show, id: @user
      expect(response).to render_template :show
    end
  end
end
