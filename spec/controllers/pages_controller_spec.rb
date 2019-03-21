require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  include Devise::Test::ControllerHelpers
  render_views
  describe "GET about" do
    it "has a 200 status code" do
      get :about
      expect(response.status).to eq(200)
    end
    it "responds with html by default" do 
      get :about
      expect(response.content_type).to eq "text/html"
    end
    it "renders about template" do 
      get :about
      expect(response).to render_template("about")
    end
  end
  describe "GET privacy_policy" do
    it "has a 200 status code" do
      get :privacy_policy
      expect(response.status).to eq(200)
    end
    it "responds with html by default" do 
      get :privacy_policy
      expect(response.content_type).to eq "text/html"
    end
    it "renders privacy_policy template" do 
      get :privacy_policy
      expect(response).to render_template("privacy_policy")
    end
  end
end