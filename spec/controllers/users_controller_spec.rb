require 'spec_helper'

describe UsersController do
  before :each do
    request.env["devise.mapping"] = Devise.mappings[:user] 
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:fitbit] 

    @user = Factory(:user)
    sign_in @user
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
