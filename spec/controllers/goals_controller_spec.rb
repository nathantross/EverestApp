require 'spec_helper'

describe GoalsController do

  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "assigns the requested goal to @goal" do
      goal = create(:goal)
      get :show, id: goal
      expect(assigns(:goal)).to eq goal
    end

    it "renders the :show template" do
      goal = create(:goal)
      get :show, id: goal
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new goal to @goal" do
      get :new
      expect(assigns(:goal)).to be_a_new(Goal)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested goal to @goal" do
      goal = create(:goal)
      get :edit, id: goal
      expect(assigns(:goal)).to eq goal
    end

    it "renders the :edit template" do
      goal = create(:goal)
      get :edit, id: goal
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    before :each do
      @goal = mock_model("Goal")
      allow(Goal).to receive(:create)
    end

    context "with valid attribuates" do
      it "saves the new goal in the database" do
          expect(Goal).to receive(:create).with({"name" => "Empire State Building", "input_interpretation" => "string"})
          post :create, {goal: {name: "Empire State Building", input_interpretation: "string"}}
      end

      it "redirects to the goals#show" do
        post :create, goal: attributes_for(:goal)
        expect(response).to redirect_to goal_path(assigns[:goal])
      end
    end

    context "with invalid attributes" do
      it "does not save the new goal in the database" do
        expect {
          post :create, goal: attributes_for(:invalid_goal)
        }.to_not change(Goal, :count)
      end

      it "re-renders the :new template" do
        post :create,
          goal: attributes_for(:invalid_goal)
        expect(response).to render_template :new
      end
    end
  end
end
