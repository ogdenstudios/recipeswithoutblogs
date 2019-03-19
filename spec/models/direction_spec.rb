require 'rails_helper'

RSpec.describe Direction, :type => :model do 
    it "is valid with valid attributes" do 
        direction = Direction.new(step: "Start the recipe", order: 1, recipe_id: 1)
        expect(direction).to be_valid
    end
    
    it "is not valid without a recipe" do 
        direction = Direction.new(step: "Start the recipe", order: 1, recipe_id: nil)
        expect(direction).to_not be_valid
    end

    it "is not valid without a step" do 
        direction = Direction.new(step: nil, order: 1, recipe_id: 1)
        expect(direction).to_not be_valid
    end
    
    it "is not valid without an order" do 
        direction = Direction.new(step: "Start the recipe", order: nil, recipe_id: 1)
        expect(direction).to_not be_valid
    end
end