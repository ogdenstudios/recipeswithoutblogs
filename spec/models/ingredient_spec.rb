require 'rails_helper'

RSpec.describe Ingredient, :type => :model do 

    it "is valid with valid attributes" do 
        ingrdient = Ingredient.new(name: "Salt", )
        expect(recipe).to be_valid 
    end
end