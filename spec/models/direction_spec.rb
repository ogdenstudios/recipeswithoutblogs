require 'rails_helper'

RSpec.describe Direction, :type => :model do 
    it "is valid with valid attributes" do 
        expect(create(:direction)).to be_valid
    end
    
    it "is not valid without a recipe" do 
        expect(build(:direction, recipe_id: nil)).to_not be_valid
    end

    it "is not valid without a step" do 
        expect(build(:direction, step: nil)).to_not be_valid
    end
    
    it "is not valid without an order" do 
        expect(build(:direction, order: nil)).to_not be_valid
    end
end