require 'rails_helper'

RSpec.describe Recipe, :type => :model do 
    it "is valid with valid attributes" do 
        expect(Recipe.new).to be_valid 
    end
end