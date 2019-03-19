require 'rails_helper'

RSpec.describe Ingredient, :type => :model do 

    it "is valid with valid attributes" do 
        ingredient = Ingredient.new(name: "Salt", recipe_id: 1)
        expect(ingredient).to be_valid 
    end

    it "is not valid without a recipe" do 
        ingredient = Ingredient.new(name: "Salt")
        expect(ingredient).to_not be_valid 
    end

    it "is not valid without a name" do 
        ingredient = Ingredient.new(name: nil, recipe_id: 1)
        expect(ingredient).to_not be_valid 
    end
end