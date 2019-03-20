require 'rails_helper'

RSpec.describe Recipe, :type => :model do 

    it "has a valid factory" do 
        recipe = create(:recipe)
        expect(recipe).to be_valid 
    end

    it "is not valid without a user" do 
        expect(build(:recipe, user_id: nil)).to_not be_valid
    end

    it "is not valid without a title" do
        expect(build(:recipe, title: nil)).to_not be_valid
    end

    it "is not valid without a description" do 
        expect(build(:recipe, description: nil)).to_not be_valid
    end

    it "is not valid with a description longer than 280 characters" do 
        expect(build(:recipe, description: (0...300).map { (rand(26).chr) })).to_not be_valid
    end

    it "is not valid without a picture" do 
        expect(build(:recipe, picture: nil)).to_not be_valid
    end

    it "is not valid without a meal category" do 
        expect(build(:recipe, meal_category: nil)).to_not be_valid
    end
end