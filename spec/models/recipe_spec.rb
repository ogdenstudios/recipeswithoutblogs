require 'rails_helper'

RSpec.describe Recipe, :type => :model do 

    it "is valid with valid attributes" do 
        recipe = create(:recipe)
        expect(recipe).to be_valid 
    end

    it "is not valid without a user" do 
        recipe = create(:recipe)
        recipe.user_id = nil
        expect(recipe).to_not be_valid
    end

    it "is not valid without a title" do
        recipe = create(:recipe) 
        recipe.title = nil
        expect(recipe).to_not be_valid
    end

    it "is not valid without a description" do 
        recipe = create(:recipe)
        recipe.description = nil
        expect(recipe).to_not be_valid
    end

    it "is not valid with a description longer than 280 characters" do 
        recipe = create(:recipe)
        recipe.description = (0...300).map { (rand(26).chr) }
        expect(recipe).to_not be_valid
    end

    it "is not valid without a picture" do 
        recipe = create(:recipe)
        recipe.picture = nil
        expect(recipe).to_not be_valid
    end

    it "is not valid without a meal category" do 
        recipe = create(:recipe)
        recipe.meal_category = nil
        expect(recipe).to_not be_valid
    end
end