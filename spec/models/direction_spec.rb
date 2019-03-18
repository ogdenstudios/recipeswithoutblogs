require 'rails_helper'

RSpec.describe Direction, :type => :model do 
    it "is valid with valid attributes" do 
        recipe = Recipe.create!()
        direction = Direction.new(step: 'Do something', order: 1, recipe_id: recipe.id)
        expect(direction).to be_valid
    end
    it "is not valid without a step"
    it "is not valid without an order"
end