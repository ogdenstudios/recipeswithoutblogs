require 'rails_helper'

RSpec.describe RecipesController, :type => :controller do
    include Devise::Test::ControllerHelpers
    render_views
    describe "GET index" do
        it "has a 200 status code" do
            get :index
            expect(response.status).to eq(200)
        end
        it "responds with html by default" do 
            get :index
            expect(response.content_type).to eq "text/html"
        end
        it "renders index template" do 
            get :index
            expect(response).to render_template("index")
        end
    end

    describe "GET show" do 
        it "has a 200 status code" do
            recipe = create(:recipe)
            get :show, params: { id: recipe.id }
            expect(response.status).to eq(200)
        end
        it "responds with html by default" do 
            recipe = create(:recipe)
            get :show, params: { id: recipe.id }
            expect(response.content_type).to eq "text/html"
        end
        it "renders show template" do 
            recipe = create(:recipe)
            get :show, params: { id: recipe.id }
            expect(response).to render_template("show")
        end
    end
end