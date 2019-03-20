require 'rails_helper'

RSpec.describe Ingredient, :type => :model do 

    it "is valid with valid attributes" do 
        expect(create(:ingredient)).to be_valid 
    end

    it "is not valid without a recipe" do 
        expect(build(:ingredient, recipe_id: nil)).to_not be_valid 
    end

    it "is not valid without a name" do 
        expect(build(:ingredient, name: nil)).to_not be_valid 
    end
end