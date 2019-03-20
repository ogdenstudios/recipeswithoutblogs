require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
  describe "GET about" do
    it "has a 200 status code" do
      get :about
      expect(response.status).to eq(200)
    end
    it "responds with html by default" do 
      get :about
      expect(response.content_type).to eq "text/html"
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
  end
end