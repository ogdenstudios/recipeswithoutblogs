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
    describe "GET new" do 
        it "responds with a 302 status code if not logged in" do
            get :new
            expect(response.status).to eq(302)
        end
        it "redirects to the sign in page if not logged in" do
            get :new
            expect(response).to redirect_to('/users/sign_in')
        end
        it "has a 200 status code if logged in" do
            user = create(:user)
            sign_in user
            get :new
            expect(response.status).to eq(200)
        end
        it "responds with html by default" do 
            get :new
            expect(response.content_type).to eq "text/html"
        end
        it "renders new template if logged in" do 
            user = create(:user)
            sign_in user
            get :new
            expect(response).to render_template("new")
        end
    end
    describe "POST create" do 
        it "responds with a 302 status code if not logged in" do 
            post :create 
            expect(response.status).to eq(302)
        end
        it "redirects to the sign in page if not logged in" do
            post :create 
            expect(response).to redirect_to('/users/sign_in')
        end
    end
    describe "DESTROY recipe" do 
        it "requires a user to be logged in to delete recipes" do 
            recipe = create(:recipe)
            delete :destroy, params: { :id => recipe.id }
            expect(Recipe.where(id: recipe.id)).to exist
        end
        it "won't allow a user to delete another user's recipes" do 
            user1 = create(:user)
            user2 = create(:user) 
            allow(request.env['warden']).to receive(:authenticate!).and_return(user2)
            allow(controller).to receive(:current_user).and_return(user2)
            recipe = create(:recipe, user_id: user1.id)
            sign_in user2 
            delete :destroy, params: { :id => recipe.id }
            expect(Recipe.where(id: recipe.id)).to exist
        end
        it "allows a user to destroy a recipe when logged in" do
            user = create(:user)
            allow(request.env['warden']).to receive(:authenticate!).and_return(user)
            allow(controller).to receive(:current_user).and_return(user)
            recipe = create(:recipe, user_id: user.id)
            sign_in user 
            delete :destroy, params: { :id => recipe.id }
            expect(Recipe.where(id: recipe.id)).to_not exist
        end
    end
end