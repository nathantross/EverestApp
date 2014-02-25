require 'spec_helper'

describe GoalsController do
  describe 'GET #index' do
  end

  describe 'GET #show' do
    it "assigns the requested goal to @goal"
    it "renders the :show template"
  end

  describe 'GET #new' do
    it "assigns a new goal to @goal"
    it "renders the :new template"
  end

  describe 'GET #edit' do
    it "assigns the requested goal to @goal"
    it "renders the :edit template"
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new goal in the database"
      it redirects to goals#show
    end

    context "with invalid attributes" do
      it "does not save the new goal in the database"
      it "re-renders the :new template"
    end
  end

  describe 'PATCH #update' do
    context "with valid attributes" do
      it "updates the goal in the database"
      it "redirects to the goal"
    end

    context "with invalid attributes" do
      it "does not update the goal"
      it "re-renders the #edit template"
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the goal from the database"
    it "redirects to the goals#index"
  end
end
