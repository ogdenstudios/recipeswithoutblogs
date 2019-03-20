require "rails_helper"

RSpec.feature 'Recipe browsing', :type => :feature do
    scenario 'they can see the homepage' do
        visit root_path
        expect(page).to have_text 'Recipes'
    end
end